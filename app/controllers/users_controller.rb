class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.paginate(:page => params[:page], :per_page => 16).order(
      'created_at DESC')
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts.paginate(:page => params[:page], :per_page => 16).order('created_at DESC')
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success] = "User info saved."
      redirect_to @user
    else
      flash.now[:alert] = "User info not updated."
      render :edit
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :from, :gender)
    end
end
