class Posts::LikesController < LikesController
 before_filter :find_likeable

  def get_likers
    user_array = []
    @likeable.likers.each {|user| user_array << user }
    @likeable.commenters.each {|user| user_array << user }
    user_array << @likeable.user
    user_array = user_array.uniq - [current_user]
    user_array
  end

  def create_notifications
    user_array = get_likers
    user_array.each do |noti_user|
      Notification.create(recipient: noti_user, actor: current_user, action: "liked a post by #{@likeable.user.name}", url: post_path(@likeable), notifiable: @like)
    end
  end

  private
    def find_likeable
      resource, id = request.path.split("/")[1,2]
      @likeable = resource.singularize.classify.constantize.find(id)
    end

end
