namespace :admin do
  desc "Fill database with admin details"
  task populate: :environment do
    admin = SuperAdmin.create!(email: "admin@weboniselab.com",
                           password: "admin123",
                           password_confirmation: "admin123", member_type: "super_admin")

  end
end