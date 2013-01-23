class Superadmin::SuperAdminsController < ApplicationController
  def home

  end
  def hello
   # render :json => current_person
    render :text => "hello"
  end
end
