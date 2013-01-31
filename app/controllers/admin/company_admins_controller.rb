class Admin::CompanyAdminsController < ApplicationController

  before_filter :authenticate_person!

  def new
    @company_admin = CompanyAdmin.new()
    @company_admin.build_company
  end

  def create
    #password = p SecureRandom.base64(16)
    password = CompanyAdmin.generate_passwords
    @company_admin = CompanyAdmin.new(params[:company_admin])
    @company_admin.password = password
    @company_admin.member_type = "company_admin"
    @company_admin.banned = false
    @company = @company_admin.build_company
    @company.attributes = params[:company_admin][:company_attributes]

    if @company_admin.save
      UserMailer.registration_email(@company_admin, password).deliver
      redirect_to admin_dashboard_super_admins_path
      flash[:success] = "Email has sent to company admin successfully"
    else
      render 'new'
    end
  end

  def edit
    @company_admin = CompanyAdmin.find(params[:id])
  end

  def update
    @company_admin = CompanyAdmin.find(params[:id])
    password = params[:company_admin][:password]

    if @company_admin.update_attributes(params[:company_admin])
      flash[:success]= "Company admin password changed & mail is sent to company admin"
      UserMailer.registration_email(@company_admin, password).deliver
      #redirect_to   show_admin_dashboard_admins_path
    else
      render 'edit'
    end
  end

  def destroy
    CompanyAdmin.find(params[:id]).destroy
    flash[:success] = "Company admin and it's company is destroyed."
    redirect_to admin_dashboard_super_admins_path
  end

  def company_admin_dashboard

  end

  def users_of_company
    @company_admin = CompanyAdmin.find(current_person.id)
    @company_users = @company_admin.company.users
  end

  def create_user
    @company_admin = CompanyAdmin.find(params[:id])
    @company = @company_admin.company
    @user = @company.users.new
  end

  def save_user
    @company_admin = CompanyAdmin.find(params[:id])
    @company = @company_admin.company
    @user =  @company.users.create(params[:user])
    @user.member_type = "user"
    @user.banned = false
    if @user.save
      UserMailer.registration_email(@user, @user.password).deliver
      flash[:success] = "User Created Successfully"
      redirect_to company_admin_dashboard_company_admin_path
    end

  end

  def suspend_login
    @company_admin = CompanyAdmin.find(params[:company_admin_id])
    @company_admin.update_attribute(:banned, true)
    @company_users = @company_admin.company.users

       @company_users.each do |user|
         user.update_attribute(:banned, true)
       end
    flash[:success] = "Company Admin & Its Users Login Suspended"
    redirect_to admin_dashboard_super_admins_path
  end

  def un_suspend_login
    @company_admin = CompanyAdmin.find(params[:company_admin_id])
    @company_admin.update_attribute(:banned, false)
    @company_users = @company_admin.company.users

    @company_users.each do |user|
      user.update_attribute(:banned, false)
    end
    flash[:success] = "Company Admin and Its Users Login Un Suspended"
    redirect_to admin_dashboard_super_admins_path
  end

def get_users
  @company = Company.find(params[:company_admin_id])
  @company_users = @company.users
  respond_to do |format|
    format.js
  end
end

end
