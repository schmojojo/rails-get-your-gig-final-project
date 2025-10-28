class GigsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @gigs = policy_scope(Gig)   # <-- required by Pundit
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

  private

  def gig_params
    params.require(:gig).permit(:title, :contact, :description, :source, :category, :date)
  end

end
