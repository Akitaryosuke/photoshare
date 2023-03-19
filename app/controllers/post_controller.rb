class PostController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_index_path, notice: "投稿しました"
    else
      render :new
    end
  end


  private

  def post_params
    params.require(:post).permit(image: [])
  end

end
