class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.admin?
      @posts = Post.where(:read => false).order(updated_at: :desc) + Post.where(:read => true, :reply => false).order(updated_at: :desc) + Post.where(:reply => true).order(updated_at: :desc)
    else
      @posts = Post.where(:email => current_user.email).order(updated_at: :desc)
    end

  end

  def new
    @post = Post.new
  end

  def confirm
    @post = Post.find_or_initialize_by(id: params[:id])
    @post.assign_attributes(post_params)
    @path = params[:path]
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # if @post.save
    #   @post.update(read: false)
    #   @post.update(readforclients: false)
    #   @post.update(reply: false)
    #   SampleMailer.send_when_post_create(current_user).deliver
    #   redirect_to posts_path
    # else
    #   redirect_to posts_path
    # end
    if params[:back]
      render 'new'
    elsif @post.save
      @post.update(read: false)
      @post.update(readforclients: false)
      @post.update(reply: false)
      SampleMailer.send_when_post_create(current_user).deliver
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    if user_signed_in?
      @post = Post.find(params[:id])
      if current_user.admin?
        @post.update(read: true)
      else
        @post.update(readforclients: true)
      end
      @comment = Comment.new
      @comments = @post.comments
    else
      redirect_to home_index_path
    end
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
    @post = Post.find_by(id: params[:id])
    @post.destroy


      # 投稿一覧へリダイレクト
    redirect_to posts_path
  end

  private
    # paramsから欲しいデータのみ抽出
  def post_params
      params.require(:post).permit(:email, :content, :category, :read, :readforclients, :reply, :condo_name, :price, :size, :floor, :storey, :age, :total_unit, :city, :station, :budget, :floor_plan)
  end
end
