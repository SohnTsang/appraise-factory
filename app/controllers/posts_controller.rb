class PostsController < ApplicationController
  def index
    if current_user.admin?
      @posts = Post.all
    else
      @posts = Post.where(:email => current_user.email)
    end

  end

  def new
    @post = Post.new
    @user = current_user.email
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  def show
    @post = Post.find(params[:id])
    if current_user.admin?
      @post.update(read: true)
    end
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
      post = Post.find(params[:id])
      # モデルの更新は、クラスメソッドのupdateメソッドで行える
      post.update(post_params)

      # リダイレクト処理
      redirect_to post
  end

  def destroy
      @Post = Post.find_by(id: params[:id])
      @Post.destroy


      # 投稿一覧へリダイレクト
      redirect_to posts_path
    end

  private
    # paramsから欲しいデータのみ抽出
  def post_params
      params.require(:post).permit(:email, :content, :category, :read)
  end
end
