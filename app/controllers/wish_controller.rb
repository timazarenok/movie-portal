class WishController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wishable

  def create
    current_user.add_wish_to(@likeable)

    respond_to do |format|
      format.html {redirect_to :back}
      format.js {}
    end 
  end
  
  def destroy
    current_user.remove_wish_from(@likeable)

    respond_to do |format|
      format.html {redirect_to :back}
      format.js {}
    end 
  end

  private 

  def set_wishable
    @wishable = Movie.find(params[:movie_id])
  end
end
