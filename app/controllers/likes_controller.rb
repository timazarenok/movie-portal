class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_likeable

  def create
    current_user.add_like_to(@likeable)

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
  
  def destroy
    current_user.remove_like_from(@likeable)

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  private 

  def set_likeable
    @likeable = Movie.find(params[:movie_id])
  end

end
