class Admin::CompanyAdminsController < ApplicationController

  def new
    @company_admin = CompanyAdmin.new()
  end

  def create
    password = p SecureRandom.base64(16)
    @company_admin = CompanyAdmin.new(:first_name => params[:first_name], :last_name => params[:last_name],
                                      :email => params[:email], :password => password)

    if @company_admin.save!
      UserMailer.registration_email(@company_admin, password).deliver
      redirect_to admin_dashboard_super_admins_path
      flash[:success] = "Email has sent successfully"
    else
      render 'new'
    end

  end
end
