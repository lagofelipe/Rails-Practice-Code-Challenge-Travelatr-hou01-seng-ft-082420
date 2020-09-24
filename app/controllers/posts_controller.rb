class PostsController < ApplicationController
  before_action :current_post, only: [:show, :edit, :update, :destroy]
  
  def current_post
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    @destinations = Destination.all
    @bloggers = Blogger.all
  end

  def create
    new_post = Post.new(post_params)
    if !@post.valid?
      flash[:errors] = new_post.errors.full_message
      redirect_to new_post_path
    else
      new_post.save
      redirect_to post_path
    end
  end

  def edit
    @destinations = Destination.all
    @bloggers = Blogger.all
  end

  def update
    if !@post.valid?
        flash[:errors] = new_post.errors.full_message
        redirect_to edit_post_path
      else
        new_post.save
        redirect_to post_path
      end
  end


  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end
end
