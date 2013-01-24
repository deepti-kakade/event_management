class SessionsController < Devise::SessionsController

  def new

  end

  def create
    person = Person.find_by_email(params[:person][:email])
    if person.present? && person.valid_password?(params[:person][:password])
      if person.member_type.include?("company_admin")
        sign_in person
        redirect_to  company_admin_dashboard_company_admins_path
      else
      sign_in person
      redirect_to  admin_dashboard_super_admins_path
      end
    else
      flash[:error] = 'Invalid email/password'
      render 'new'
    end
  end

end
