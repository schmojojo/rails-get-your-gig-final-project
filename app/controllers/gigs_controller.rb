class GigsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  require 'net/http'
  require 'uri'
  require 'json'

  SYSTEM_PROMPT = <<-PROMPT

  you are an expert file clerck

  I am a beginner file clerck who wants to filter out a large jobs list into programming jobs only.

  Help me select the jobs from #{create_jobs} that are only for programmers and shorten and filter out '\n\n' from (description:).

  Answer concisely in Markdown.

  PROMPT

  def index
    @gigs = policy_scope(Gig)  # required by Pundit

    if params[:query].present?
      @gigs = @gigs.search_by_details(params[:query])
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
    @ruby_llm_chat = RubyLLM.chat
    response = @ruby_llm_chat.with_instructions(SYSTEM_PROMPT).with_schema(GigSchema).ask(@gig)
    @gigs = Gig.all
    @gigs << response
  end


  private

  def gig_params
    params.require(:gig).permit(:title, :contact, :description, :source, :category, :date)
  end


  def create_jobs
    parsing
    @jobs["data"].each do |job|
      Gig.new(
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
    request.body = "{\"page\": 0,\n  \"limit\": 5,\n  \"job_country_code_or\": [\n    \"US\"\n  ],\n  \"posted_at_max_age_days\": 7}"

    response = http.request(request)
    @jobs = JSON.parse(response.body)
  end
end
