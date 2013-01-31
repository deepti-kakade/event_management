class UserMailer < ActionMailer::Base
  default from: "pansingh@weboniselab.com"

  def registration_email(company_admin, password)
    @company_admin = company_admin
    @password = password
    mail(:to => company_admin.email, :subject => "You have Signed Successfully for Company Admin" )
    return @company_admin, @password, @url
  end

  def update_event_status(user)
    @user = user
    mail(:to => user.email, :subject => "Event Acceptance" )
    return @user
  end
end
