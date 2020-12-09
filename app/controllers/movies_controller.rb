class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :like, :unlike]

  def index
    @movies = Movie.all
  end

  def show
    get_actors
  end

  def like
    Like.create(user: current_user, likeable: @movie)
    respond_to do |format|
      format.html do
      flash[:success] = "Like Counted!"
      redirect_to @movie
    end
    
    format.js
    end
  end

  def unlike
    @record = Like.where(user_id: current_user.id).where(likeable: @movie)
    @record.destroy_all
    respond_to do |format|
      format.html {redirect_to @movie}
      format.js {}
    end 
  end

  private

  def set_movie
    @movie ||= Movie.find(params[:id])
  end

  def get_actors
    @actors ||= @movie.actors
  end
end
