class LikesController < ApplicationController
  before_action :authenticate_user!

  # Like a model
  def create
    @user = current_user
    @like = @user.likes.build(likeable: @likeable)
    @like.save
    if @likeable.class == Post
      user_array = []
      @likeable.likers.each {|user| user_array << user }
      @likeable.commenters.each {|user| user_array << user }
      user_array << @likeable.user
      user_array = user_array.uniq
      user_array.delete(current_user)

      user_array.each do |user|
        Notification.create(recipient: user, actor: current_user, action: "liked", notifiable: @like)
      end
    else
      user_array = []
      @likeable.likers.each {|user| user_array << user }
      user_array << @likeable.user
      user_array = user_array.uniq
      user_array.delete(current_user)

      user_array.each do |user|
        Notification.create(recipient: user, actor: current_user, action: "liked", notifiable: @like)
      end
    end

    redirect_to :back
  end

  # Dislike a model
  def destroy
    @user = current_user
    @like = @user.likes.find(params[:id])
    @like.destroy
    redirect_to :back
  end

 
end
