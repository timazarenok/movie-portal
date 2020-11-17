class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def show
    get_actors
  end

  private

  def set_movie
    @movie ||= Movie.find(params[:id])
  end

  def get_actors
    @actors ||= @movie.actors
  end
end
