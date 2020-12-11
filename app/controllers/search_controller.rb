class SearchController < ApplicationController

  def search
    @q = params[:q]
    @movies = params[:q].nil? ? [] : Movie.search_published(params[:q])
  end

end
