class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @post = Post.new
    @posts = @user.feed.paginate(:page => params[:page], :per_page => 20)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Posted!"
      redirect_to :back
    else
      flash[:alert] = "Your post could not be published."
      redirect_to :index
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:content, :photo)
    end
end
