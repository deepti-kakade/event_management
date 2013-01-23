namespace :db do
  desc "Fill database with admin details"
  task populate: :environment do
    admin = Person.create!(email: "admin@weboniselab.com",
                           password: "admin123",
                           password_confirmation: "admin123")

  end
end