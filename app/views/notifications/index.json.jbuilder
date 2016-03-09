json.array! @notifications do |notification|
  json.actor notification.actor.name
  json.action notification.action
  json.url notification.url
end
