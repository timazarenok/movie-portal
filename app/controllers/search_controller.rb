class SearchController < ApplicationController
  
  def search
    @q = params[:q]
    @results = params[:q].nil? ? [] : MultySearch.new.search(params[:q]).results
  end
end
