class EventsController < ApplicationController
before_filter :authenticate_person!


  #def show
  #  @event = Event.find(params[:id])
  #end

  def new
    @user = User.find(params[:user_id])
    logger.info("#####################################{@user.inspect}")
    @event = @user.events.new
  end
 #def show
 #  @event = Event.find(params[:id])
 #  @user_who_commented = current_person
 #  #@all_comments = @Post.comment_threads
 #  comments = @event.comments.all
 #  parent_child_hash = Hash.new
 #  @nested_comment_list = Array.new
 #
 #  comments.select{|i| i.parent_id==nil }.each do |comment|
 #    child_comments = comments.select{|cmt| cmt.parent_id==comment.id&&cmt.parent_id!=nil}
 #    parent_child_hash = {"comment" => comment, "child_comments" => child_comments }
 #    @nested_comment_list.push(parent_child_hash);
 #  end
 #  @comment = Comment.new
 #
 #end


  def create
    @user = User.find(current_person)
    logger.info("################################{params[:event].inspect}")
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

  #def update_event_status
  #  @event = Event.find(params[:id])
  #
  #  respond_to do |format|
  #    @event.update_attribute(:status, params[:status])
  #    format.js
  #  end
  #  redirect_to admin_dashboard_super_admins_path
  #end

end
