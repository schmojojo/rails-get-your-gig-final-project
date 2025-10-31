class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    authorize @bookmark
    @bookmark.gig = @gig
    @bookmark.user = current_user
    if @bookmark.save
      redirect_to profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def delete
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end

  private

  def set_gig
    @gig = Gig.find(params[:gig_id])
  end
end
