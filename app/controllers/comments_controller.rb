class CommentsController < ApplicationController

  def create
    content = params[:comment][:content]
    @comment = current_user.comments.create(content: content, post_id: params[:post_id])    
    flash[:notice] = "Comment posted!"
    redirect_to :back
  end

end
