class BookmarksController < ApplicationController
  before_action :set_gig, only: [:create]
  before_action :set_bookmark, only: [:destroy]

def index
    @bookmarks = policy_scope(Bookmark)
    @user = current_user
  end

  def create
    @bookmark = Bookmark.new(gig: @gig, user: current_user)
    authorize @bookmark

    respond_to do |format|
      if @bookmark.save
        format.turbo_stream
        format.html { redirect_to gigs_path, notice: "Gig saved!" }
      else
        format.html { redirect_to gigs_path, alert: "Could not save gig." }
      end
    end
  end

  def destroy
    authorize @bookmark
    @gig = @bookmark.gig

    @bookmark.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to gigs_path, notice: "Gig unsaved." }
    end
  end

  private

  def set_gig
    @gig = Gig.find(params[:gig_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
