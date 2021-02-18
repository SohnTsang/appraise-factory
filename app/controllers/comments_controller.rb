class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      if @comment.user_id != current_user.admin
        @post.update(read: false)
        @post.update(reply: false)
        SampleMailer.send_when_client_reply(current_user).deliver
      else
        @post.update(readforclients: false)
      end
      if current_user.admin?
        @post.update(reply: true)
        @post.update(readforclients: false)
        SampleMailer.send_when_admin_reply(@post.user).deliver
      end

      redirect_to request.referer
    else
      @post_new = Post.new
      @comments = @post.comments
      redirect_to new_post_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
