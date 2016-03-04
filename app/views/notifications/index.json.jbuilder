json.array! @notifications do |notification|
  json.actor notification.actor.name
  json.action notification.action
  if notification.notifiable == @like
    if notificatoin.notifiable.likeable_type == "Comment"
      json.notifiable do
        json.type "a comment by #{notification.notifiable.user.name}"
      end
      json.url post_path(notification.notifiable.likeable.post)
    elsif notification.notifiable.likeable_type == "Post"
      json.notifiable do
        json.type "a post by #{notification.notifiable.user.name}"
      end
      json.url post_path(notification.notifiable.likeable)
    end
  elsif notification.notifiable == @comment
    json.notifiable do
      json.type "a post by #{notification.notifiable.post.user.name}"
    end
    json.url post_path(notification.notifiable.post)
  elsif notification.notifiable.class == User
    if notification.action == "requested"
      json.notifiable do
        json.type "friendship"
      end
      json.url friends_path
    elsif notification.action == "confirmed"
      json.notifiable do
        json.type "friendship"
      end
      json.url user_path(notification.notifiable)
    end
  end
end