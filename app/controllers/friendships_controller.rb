class FriendshipsController < ApplicationController
    before_filter :authenticate_user!
  
  def index
    @friends = current_user.friends.paginate(:page => params[:page], :per_page => 16).order(
      'created_at DESC')
    @pending = current_user.pending_invited_by
  end  

  def create
    invitee = User.find_by_id(params[:user_id])
    if current_user.invite invitee
      redirect_to users_path, :notice => "Successfully invited friend!"
      Notification.create(recipient: invitee, actor: current_user, action: "requested", notifiable: current_user)
    else
      redirect_to users_path, :notice => "Sorry! You can't invite that user!"
    end
  end

  def update
    inviter = User.find(params[:id])
    if current_user.approve(inviter)
      redirect_to friends_path, :notice => "Successfully confirmed friend!"
      Notification.create(recipient: inviter, actor: current_user, action: "confirmed", notifiable: current_user)
    else
      redirect_to friends _path, :notice => "Sorry! Could not confirm friend!"
    end
  end

  def requests
    @pending_requests = current_user.pending_invited_by
  end

  def invites
    @pending_invites = current_user.pending_invited
  end

  def destroy
    user = User.find(params[:id])
    if current_user.remove_friendship(user)
      redirect_to friends_path, :notice => "Successfully removed friend"
    else
      redirect_to friends_path, :notice => "Sorry! Could not remove friend!"
    end
  end
end
  