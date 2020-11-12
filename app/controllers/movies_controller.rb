class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @category = Category.find(@movie.category_id)
    @director = Director.find(@movie.director_id)
  end
end
