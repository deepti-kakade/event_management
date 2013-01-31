class Admin::CompaniesController < ApplicationController

  before_filter :authenticate_person!

  def show
    @company = Company.find(params[:id])
    @company_admin =@company.company_admin
    respond_to do |format|
      format.js
    end
  end

end
