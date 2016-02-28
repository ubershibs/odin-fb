class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = @likeable.likes.new(like_params)
    @like.user = current_user
    @like.save
    flash[:success] = "Like successful!"
    redirect_to @likeable
  end

  def destroy
  end

  private

    def like_params
      params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
    end

end
