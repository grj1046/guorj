namespace :db do
  desc "File database with sample data"
  task populate: :environment do
    generate_user
    generate_article 
  end

  def generate_user
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
  end # end

  def generate_article
    #50.times do |n|
    #  User.first.articles.create!(title: Faker::Lorem.sentence(1), content:Faker::Lorem.sentence(5))
    #end

    users = User.all.limit(6)
    users.each do |user|
      50.times do
        user.articles.create!(title: Faker::Lorem.sentence(1), content:Faker::Lorem.sentence(5))
      end
    end
  end # end
end
