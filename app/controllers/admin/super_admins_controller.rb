class Admin::SuperAdminsController < ApplicationController
  def home

  end
  def admin_dashboard
  @companies = Company.all
  end
end
