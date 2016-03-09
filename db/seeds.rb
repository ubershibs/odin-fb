
User.create!(name: "Luke Walker",
             email: "lukewalker@lukewalker.org",
             password:              "foobar12",
             password_confirmation: "foobar12")

99.times do |n|
  name = Faker::Name.name
  email = "luke-#{n+1}@lukewalker.org"
  password = "foobar12"

  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
10.times do
  users[0].posts.create(content: Faker::Hipster.paragraphs(1))
  users[1].posts.create(content: Faker::Hipster.paragraphs(1))
  users[2].posts.create(content: Faker::Hipster.paragraphs(1))
  users[3].posts.create(content: Faker::Hipster.paragraphs(1))
  users[4].posts.create(content: Faker::Hipster.paragraphs(1))
end
