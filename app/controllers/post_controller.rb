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
      redirect_to post_index_path, notice: "投稿しました"
    else
      render :new
    end
  end
  
  # 画像アップロード用のアクション
  def upload_image
    @image_blob = create_blob(params[:image])
    render json: @image_blob
  end

  
  private

  def post_params
    params.require(:post).merge(images: uploaded_images)
  end
  
  # アップロード済み画像の検索
  def uploaded_images
    params[:post][:images].drop(1).map{|id| ActiveStorage::Blob.find(id)} if params[:post][:images]
  end

  # blobデータの作成
  def create_blob(file)
    ActiveStorage::Blob.create_and_upload!(
      io: file.open,
      filename: file.original_filename,
      content_type: file.content_type
    )
  end
  
end
