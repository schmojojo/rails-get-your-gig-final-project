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

    @gigs = @gigs.page(params[:page]).per(24)  # Kaminari pagination
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

  private

  def gig_params
    params.require(:gig).permit(:title, :contact, :description, :source, :category, :date)
  end

end
