class UsersController < ApplicationController

  # before_filter :deny_banned

  def user_dashboard
   @user = User.find(current_person)
   @user_company = @user.company
   @company_events = @user_company.events
  end

  def create_profile
   @user = User.find(current_person)
   @user_profile = @user.build_user_profile
  end

  def save_profile
    @user = User.find(current_person)
    @user_profile = @user.create_user_profile(params[:user_profile])
    if @user_profile.save!
      @user.update_attribute(:first_name, params[:first_name])
      @user.update_attribute(:last_name, params[:last_name])
      redirect_to user_dashboard_user_path(@user)
    end
  end

  protected
  def deny_banned
    if current_person.banned?
      redirect_to root_path, :notice => "You are banned from this site."
    end
  end

   #def active_for_authentication?
   #  super && !self.blocked
   #end
end
