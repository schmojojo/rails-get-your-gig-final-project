class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gig, only: [:create, :destroy]
  skip_after_action :verify_policy_scoped

  def index
    @user = current_user
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

  def bookmark_params
    params.requrire(:boomkark).permit(:user_id, :gig_id)
  end
end
