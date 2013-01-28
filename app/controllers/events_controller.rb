class EventsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    logger.info("#####################################{@user.inspect}")
    @event = @user.events.new
  end

  def create
    @user = User.find(current_person)
    @event = @user.events.create(params[:event])
    @event.company_id = params[:id]
    @event.status = "Approval"
    if @event.save!
      flash[:success] = "Event Created Successfully."
      redirect_to user_dashboard_user_path(@user)
    else
      flash[:error] = "Event Is Not Created."
      render 'new'
    end
  end
end
