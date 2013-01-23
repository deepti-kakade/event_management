class SessionsController < Devise::SessionsController

  def new

  end

  def create
    person = Person.find_by_email(params[:person][:email])
    if person.present? && person.valid_password?(params[:person][:password])
      sign_in person
      redirect_to  hello_super_admins_path
    else
      flash[:error] = 'Invalid email/password'
      render 'new'
    end
  end

end
