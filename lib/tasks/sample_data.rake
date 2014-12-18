namespace :db do
  desc "File database with sample data"
  task populate: :environment do
    generate_users
    generate_articles 
    generate_ings
  end

  def generate_users
    User.create!(name: "admin",
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
  end # end

  def generate_articles
    #50.times do |n|
    #  User.first.articles.create!(title: Faker::Lorem.sentence(1), content:Faker::Lorem.sentence(5))
    #end

    users = User.all.limit(6)
    users.each do |user|
      50.times do
        user.articles.create!(title: Faker::Lorem.sentence(1), content:Faker::Lorem.sentence(500))
      end
    end
  end # end

  def generate_ings
    users = User.all.limit(6)
    users.each do |user|
      50.times do
        user.ings.create!(content: Faker::Lorem.sentence(50))
      end
    end
  end # end
end
