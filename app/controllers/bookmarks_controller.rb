class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gig

  def index
    @bookmarks = current_user.bookmarks.all
  end

  def create
    authorize @gig
    @gig.bookmarks.create!(user: current_user)
    respond_to do |format|
      format.html { redirect_to @gig, notice: "bookmarked successfully"}
      format.turbo_stream
    end
  end

  def destroy
    authorize @gig
    bookmark = @gig.bookmarks.find(params[:id])
    bookmark.destroy
    respond_to do |format|
      format.html { redirect_to @gig, notice: "bookmarked successfully"}
      format.turbo_stream
    end
  end

  private

  def set_gig
    @gig = Gig.find(params[:gig_id])
  end
end
