class BloggersController < ApplicationController

  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find(params[:id])
    @featured_post = @blogger.featured_post
  end

  def new
    @blogger = Blogger.new
  end

  def create
    new_blogger = Blogger.new(blogger_params)

    if !new_blogger.valid?
      flash[:errors] = new_blogger.errors.full_messages

      redirect_to new_blogger_path
    else
      new_blogger.save
      redirect_to blogger_path
    end
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end
end
