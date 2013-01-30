class EventsController < ApplicationController


  def index
   @events = Event.all
  end

  #def show
  #  @event = Event.find(params[:id])
  #end

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

  def event_approval
    #render :action => :index
  end

  def update_event_status
    @event = Event.find(params[:id])
    @event.update_attribute(:status, params[:status])
   # redirect_to
  end
end
