class IndexController < ApplicationController
  def index
    get_films
    get_tv_serials
  end

  private 

  def get_films
    @movies = Movie.all
  end

  def get_tv_serials
    @tv_serials = Serial.all
  end
end
