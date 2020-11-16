class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :delete, :update]

  def show; end

  private

  def set_movie
    @movie ||= Movie.find(params[:id])
  end
end
