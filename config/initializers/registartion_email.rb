ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :address            => "smtp.gmail.com",
    :port               => "587",
    :domain             => "gmail.com",
    :authentication     => :plain,
    :user_name          => "pansingh@weboniselab.com",
    :password           => "pansingh6186"
}
ActionMailer::Base.default_url_options[:host] = "admin.event_management.com"