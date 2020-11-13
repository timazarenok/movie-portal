class IndexController < ApplicationController
    def index

        @movies = Movie.all
    end
end
