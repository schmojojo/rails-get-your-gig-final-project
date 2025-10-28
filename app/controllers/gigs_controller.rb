class GigsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @gigs = Gig.all.order(date: :desc)
  end
  
end
