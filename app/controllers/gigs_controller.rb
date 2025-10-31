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
    authorize @gig
    @ruby_llm_chat = RubyLLM.chat
    AiCreateJob.perform_later(instructions)
  end


  private

  def gig_params
    params.require(:gig).permit(:title, :contact, :description, :source, :category, :date)
  end

end
