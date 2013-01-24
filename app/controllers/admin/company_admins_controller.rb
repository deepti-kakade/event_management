class Admin::CompanyAdminsController < ApplicationController

  def new
    @company_admin = CompanyAdmin.new()
    @company_admin.build_company
  end

  def create
    password = p SecureRandom.base64(16)
    @company_admin = CompanyAdmin.new(params[:company_admin])
    @company_admin.password = password
    @company_admin.member_type = "company_admin"
    @company = @company_admin.build_company
    @company.attributes = params[:company_admin][:company_attributes]

    if @company_admin.save!
      UserMailer.registration_email(@company_admin, password).deliver
      redirect_to admin_dashboard_super_admins_path
      flash[:success] = "Email has sent successfully"
    else
      render 'new'
    end
  end


end
