class IndexController < ApplicationController
  def index
    get_films
    get_tv_serials
  end

  private

  def get_films
    @movies = Movie.where(release_date: DateTime.new(2020)..Time.now).order(release_date: :desc).take(25)
  end

  def get_tv_serials
    @tv_serials = Serial.take(25)
  end
end
