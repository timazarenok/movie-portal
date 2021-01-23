class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :authenticate_user!

  def create
    @comment = Comment.create(user: current_user, commentable: @commentable, time: Time.now.strftime("%d-%m-%Y %k:%M"), body: comment_params[:body])

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render layout: false }
    end  
  end

  private
  
  def set_commentable
    if !params[:movie_id].nil?
      @commentable = Movie.find(params[:movie_id])
    end
    if !params[:serial_id].nil?
      @commentable = Serial.find(params[:movie_id])
    end
    @commentable
  end

  def comment_params 
    params.require(:comment).permit(:body)
  end
end
