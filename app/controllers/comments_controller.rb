class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment posted!"
      redirect_to :back
    else
      flash.now[:danger] = "Error posting comment."
      render :back
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
