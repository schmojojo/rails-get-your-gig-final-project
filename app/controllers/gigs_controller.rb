class GigsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  require 'net/http'
  require 'uri'
  require 'json'



  SYSTEM_PROMPT = <<-PROMPT

  you are an expert file clerck

  I am a beginner file clerck who wants to filter out a large jobs list into programming jobs only.

  Help me select all the jobs from a jobs list that have either a title, description or category related to the field of technology, filter out '\n\n' from (Description:) and shorten it, and display them as an array of Json objects.

  Answer concisely in Markdown.

  PROMPT

  def index
    @gigs = policy_scope(Gig)  # required by Pundit

    if params[:query].present?
      @gigs = @gigs.search_by_details(params[:query])
    end

    # Filter by selected categories if any
    if params[:categories].present?
      @gigs = @gigs.where(category: params[:categories])
    end
  end

  def show
    @gig = Gig.find(params[:id])
    authorize @gig              # <-- call policy show?
  end

  def new
    @gig = Gig.new
    authorize @gig              # <-- call policy new?/create?
  end

  def create
    @gig = Gig.new(gig_params)
    authorize @gig              # <-- must come BEFORE save
    @gig.save!
    redirect_to @gig
  end

  def edit
    @gig = Gig.find(params[:id])
    authorize @gig              # <-- update?
  end

  def update
    @gig = Gig.find(params[:id])
    authorize @gig
    @gig.update!(gig_params)
    redirect_to @gig
  end

  def destroy
    @gig = Gig.find(params[:id])
    authorize @gig
    @gig.destroy
    redirect_to gigs_path
  end

   def ai_create
    @gigs = Gig.all
    @gig = Gig.new
    @ruby_llm_chat = RubyLLM.chat(model: "codex-mini-latest", provider: :openai)
    response = @ruby_llm_chat.with_instructions(instructions).with_schema(GigSchema).ask(@gig)
    raise
    gigs_json = response.content
    gigs_json["gigs"].each do |gig|
      @gig = Gig.create!(
        title: gig["title"],
        description: gig["description"],
        contact: gig["contact"],
        source: gig["source"],
        date: gig["date"],
        category: gig["category"]
      )
    end
  end


  private

  def gig_params
    params.require(:gig).permit(:title, :contact, :description, :source, :category, :date)
  end


  def create_jobs
    parsing
    @ai_jobs = []
    @jobs["data"].each do |job|
     @ai_jobs << Gig.new(
        title: job["job_title"],
        description: job["description"],
        contact: (job["final_url"] || job["company_object"]["linkedin_url"] || job["source_url"]),
        source: job["source_url"],
        date: job["date_posted"],
        category: (job["technology_slugs"][0] || "misc.")
      )
    end
  end



  def parsing
    url = URI("https://api.theirstack.com/v1/jobs/search")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = ENV["BEARER"]
    request.body = "{\"page\": 0,\n  \"limit\": 30,\n  \"job_country_code_or\": [\n    \"US\"\n  ],\n  \"posted_at_max_age_days\": 7}"

    response = http.request(request)
    @jobs = JSON.parse(response.body)
  end

   def job_context
    text = "here's the info about the jobs in the list:"
    create_jobs
    @ai_jobs.each do |job|
      text += " Title: #{job.title}, Description: #{job.description} Date: #{job.date}, Source: #{job.source}, Category: #{job.category}, Contact: #{job.contact}"
    end
    text
  end

  def instructions
    [SYSTEM_PROMPT, job_context].join("\n\n")
  end

end
