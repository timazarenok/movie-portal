class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def index
    @movies = Movie.all
  end

  def show
    get_actors
  end

  def search
    query = params[:search_movies].presence && params[:search_movies][:query]
  
    if query
      @posts = Movie.search_published(query)
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
