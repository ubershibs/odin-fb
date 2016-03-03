class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @post = Post.new
    @posts = Post.paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
  end

  def create
    content = params[:post][:content]
    @post = current_user.posts.build(content: content)
    @post.save
    flash[:success] = "Posted!"
    redirect_to :back
  end

end
