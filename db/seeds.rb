User.create(
  username: "hgwells",
  email:    "hg@wells.com",
  password: p = Faker::Internet.password,
  password_confirmation: p
)
5.times do
  User.create(
    username: Faker::Internet.user_name,
    email:    Faker::Internet.email,
    password: p = Faker::Internet.password,
    password_confirmation: p
  )
end
users = User.all

Post.create(
  title: "How to use ActiveRecord",
  content: File.read("#{Rails.root}/README.md"),
  user_id: users.first.id,
  private: true,
  publish_at: (rand(30) - 15).days.from_now
)

200.times do
  Post.create(
    title: Faker::Company.catch_phrase,
    content: Faker::Hacker.say_something_smart,
    user_id: users.sample.id,
    private: [true, false].sample,
    publish_at: (rand(30) - 15).days.from_now
  )
end

User.create(
  username: "boo",
  email:    "boo@wells.com",
  password: p = Faker::Internet.password,
  password_confirmation: p
)
