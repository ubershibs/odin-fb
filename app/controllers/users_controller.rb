class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.paginate(:page => params[:page], :per_page => 16).order(
      'created_at DESC')
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts
  end

end
