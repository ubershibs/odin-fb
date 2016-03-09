class LikesController < ApplicationController
  before_action :authenticate_user!

  # Like a model
  def create
    @user = current_user
    @like = @user.likes.build(likeable: @likeable)
    @like.save
    create_notifications
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
