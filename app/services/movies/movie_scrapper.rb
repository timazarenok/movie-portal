module Movies
  class MovieScrapper
    def initialize(service)
      @guest_id = service.guest_id
    end

    def getList(id, p_s)
        url = "https://api.themoviedb.org/3/list/#{id}?api_key=#{ENV['TMDB_API_KEY']}&language=en-US"
        data = JSON.parse(URI.open(url).read)
        data["items"].each do |el|
          credits = getCredits(el["id"])
          director = p_s.get_director(credits["crew"])
          movie_data = getMovie(el["id"])
          movie = Movie.create(name: movie_data["original_title"], image: movie_data["poster_path"], description: movie_data["overview"], clip: "", release_date: movie_data["release_date"], duration: "02:04", category: Category.find_by(name: movie_data["genres"][0]["name"]), director: director)
          p_s.set_movie_actors(movie.id, credits["cast"])
        end
    end

    def getMovie(id)
      url = "https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV['TMDB_API_KEY']}&language=en-US"
      JSON.parse(URI.open(url).read)
    end

    def getCredits(id)
      url = "https://api.themoviedb.org/3/movie/#{id}/credits?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&append_to_response=#{ENV['GUEST_SESSION_ID']}"
      JSON.parse(URI.open(url).read)
    end
  end
end
