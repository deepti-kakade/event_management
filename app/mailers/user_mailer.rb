class UserMailer < ActionMailer::Base
  default from: "pansingh@weboniselab.com"

  def registration_email(company_admin)
    @company_admin = company_admin
    mail(:to => company_admin.email, :subject => "You have Signed Up Successfully for Company Admin" )
  end
end
