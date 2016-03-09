class Comments::LikesController < LikesController
 before_filter :set_likeable

 def get_likers
    user_array = []
    @likeable.likers.each {|user| user_array << user }
    user_array << @likeable.user
    user_array = user_array.uniq - [current_user]
    user_array
  end

  def create_notifications
    user_array = get_likers
    user_array.each do |user|
      Notification.create(recipient: user, actor: current_user, action: "liked a comment by #{@likeable.user.name}", url: post_path(@likeable.post), notifiable: @like)
    end
  end

  private
    def set_likeable
      array = request.path.split("/")
      resource, id = array[3], array[4]
      @likeable = resource.singularize.classify.constantize.find(id)
    end

end
