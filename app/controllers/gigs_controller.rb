class GigsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  require 'net/http'
  require 'uri'
  require 'json'

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
    if @gig.save
      redirect_to gigs_path, notice: "Gig was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @gig = Gig.find(params[:id])
    authorize @gig
  end

def update
  @gig = Gig.find(params[:id])
  authorize @gig
  if @gig.update(gig_params)
    redirect_to gigs_path, notice: "Gig was successfully updated."
  else
    render :edit, status: :unprocessable_content
  end
end

  def destroy
    @gig = Gig.find(params[:id])
    authorize @gig
    @gig.destroy
    redirect_to gigs_path
  end

  def fetch_jobs
    url = URI("https://api.theirstack.com/v1/jobs/search")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = ENV["BEARER"]
    request.body = "{\"page\": 0,\n  \"limit\": 25,\n  \"job_country_code_or\": [\n    \"US\"\n  ],\n  \"posted_at_max_age_days\": 7}"
    p request
    response = http.request(request)
    p response
    gigs = JSON.parse(response.body)["data"]
    raise
  end

  private

  def gig_params
    params.require(:gig).permit(:title, :contact, :description, :source, :category, :date)
  end

end
