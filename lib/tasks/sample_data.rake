namespace :db do
  desc "File database with sample data"
  task populate: :environment do
    User.create!(name: "nil",
                 email: "nil@guorj.com",
                 admin: true,
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@guorj.com"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    #users = User.all(limit: 6)
    #50.times do |n| 
    #  content = Faker::Lorem.sentence(5)
    #  users.each { |user| user.articles.create!({title: "title {n}", content: content}) }
    #end
  end
end
