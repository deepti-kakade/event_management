class Superadmin::CompanyAdminsController < ApplicationController

  def new
    @company_admin = CompanyAdmin.new()
  end

  def create
    password = ActiveSupport::SecureRandom.base64(6)
    @company_admin = CompanyAdmin.new(:first_name => params[:first_name], :last_name => params[:last_name],
                                      :email => params[:email], :password => password, :company_name => params[:company_name])

    if @company_admin.save!
      UserMailer.registration_email(@company_admin).deliver
      redirect_to root_url
    else
      render 'new'
    end

  end
end
