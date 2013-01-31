class Admin::SuperAdminsController < ApplicationController
  before_filter :authenticate_person!
  def home

  end
  def admin_dashboard
  @companies = Company.all
  end

end
