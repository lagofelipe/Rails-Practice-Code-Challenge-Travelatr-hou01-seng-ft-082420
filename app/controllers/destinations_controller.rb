class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
    @posts = @destination.posts.order("created_at DESC LIMIT 5")
    @featured_post = @destination.featured_post
    @average_age = @destination.average_age
  end
end
