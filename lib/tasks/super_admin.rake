namespace :db do
  desc "Fill database with admin details"
  task populate: :environment do
    admin = Person.create!(email: "deepti@weboniselab.com",
                           password: "superadmin",
                           password_confirmation: "superadmin")

  end
end