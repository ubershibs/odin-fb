
User.create!(name: "Luke Walker",
             email: "2@lukewalker.org",
             password:              "foobar12",
             password_confirmation: "foobar12")

99.times do |n|
  name = Faker::Name.name
  email = "luke-#{n+1}@lukewalkers.org"
  password = "foobar12"
  
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create(content: content) }
end

posts = Post.order(:created_at).take(10)
50.times do |n|
  comment = Faker::Lorem.sentence(2)
  post.each { |post| post.comments.create(user_id: n, content: comment) }
  n += 1
end