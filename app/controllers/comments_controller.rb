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
      # Create notifications
      notifiable_users = get_notifiable_users
      notifiable_users.each do |noti_user|
        Notification.create(recipient: noti_user, actor: current_user, action: "commented on #{@post.user.name}'s post.", notifiable: @comment, url: post_path(@post))
      end
      redirect_to :back
    else
      flash.now[:danger] = "Error posting comment."
      render post_path(@post)
    end
  end


  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def get_notifiable_users
      notifiable_users = []
      @post.commenters.each { |x| notifiable_users << x }
      @post.likers.each { |x| notifiable_users << x }
      notifiable_users << @post.user
      notifiable_users = notifiable_users.uniq
      notifiable_users -= [current_user]
      notifiable_users
    end
end
