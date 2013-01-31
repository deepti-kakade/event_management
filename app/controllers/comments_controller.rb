class CommentsController < ApplicationController
  before_filter :authenticate_person!
  def create
    @event = Event.find(params[:id])
    @user_who_commented = params[:user_id]

    #@comment = Comment.build_from( @post, @user_who_commented.id, params[:comment][:body])
    if @event.comments.create(:content => params[:comment][:content],:parent_id => params[:parent_id] )
      flash[:success] = "commented successfully!"
     # redirect_to user_post_path(current_user,@post)
    else
      flash[:error] = "comment failed!"
      redirect_to :back
    end
  end

end
