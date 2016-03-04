class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if current_user.name.nil?
      flash[:success] = "Why not take a moment to give us some more info about yourself? It will make it easier for your friends to find you."
      edit_user_path(current_user)
    else
      root_url
    end
  end
end
