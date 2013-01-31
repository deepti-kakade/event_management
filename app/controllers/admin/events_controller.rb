class Admin::EventsController < ApplicationController

  before_filter :authenticate_person!

  def index
    @company_admin = CompanyAdmin.find(params[:company_admin_id])
    @events = @company_admin.company.events
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


  #def create
  #  @user = User.find(current_person)
  #  @event = @user.events.create(params[:event])
  #  @event.company_id = params[:id]
  #  @event.status = "Approval"
  #  if @event.save!
  #    flash[:success] = "Event Created Successfully."
  #    redirect_to user_dashboard_user_path(@user)
  #  else
  #    flash[:error] = "Event Is Not Created."
  #    render 'new'
  #  end
  #end

  def update_event_status
    @event = Event.find(params[:id])
    @user = @event.user
    respond_to do |format|
      @event.update_attribute(:status, params[:status])
      UserMailer.update_event_status(@user).deliver
      format.js
    end
    redirect_to admin_dashboard_super_admins_path
  end
end
