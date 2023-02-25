class PostController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all
  end
  
  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to post_index_path
    else
      render :new
    end
  end
  
  private

  def post_params
    params.require(:post).permit(image: [])
  end
  
end
