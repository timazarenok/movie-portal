class IndexController < ApplicationController
  def index
    get_films
    get_tv_serials
  end

  private 

  def get_films
    @movies = Movie.take(25)
  end

  def get_tv_serials
    @tv_serials = Serial.take(25)
  end
end
