class PostController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all
  end
  
end
