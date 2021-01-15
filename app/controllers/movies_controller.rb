class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :like, :unlike]
  before_action :set_movies, only: [:show]

  def index
    @movies = Movie.all
  end

  def show
    get_actors
  end

  private

  def set_movie
    @movie ||= Movie.find(params[:id])
  end

  def set_movies
    @movies ||= Movie.all.where(category: @movie.category).where.not(id: @movie.id)
  end

  def get_actors
    @actors ||= @movie.actors
  end
end
