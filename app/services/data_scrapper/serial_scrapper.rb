module DataScrapper
  class SerialScrapper
    def initialize(service)
      @guest_id = service.guest_id
    end

    def getSerialsList(page, p_s, season_s, series_sc)
      url = "https://api.themoviedb.org/3/tv/popular?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&page=#{page}}"
      data = JSON.parse(URI.open(url).read)
      data["results"].each do |el|
        getSerial(el["id"], p_s, season_s, series_sc)
      end
    end

    def getSerial(id, p_s, season_s, series_sc)
      url = "https://api.themoviedb.org/3/tv/#{id}?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&append_to_response=#{@guest_id}"
      data = JSON.parse(URI.open(url).read)
      credits = getCredits(data['id'])
      director = p_s.get_director(credits["crew"])
      if data["genres"][0].nil?
        genre = "Drama"
      else 
        genre = data['genres'][0]['name']
      end
      p data
      serial = Serial.create!(name: data["original_name"], description: data["overview"], image: data["poster_path"], clip: '', release_date: data["first_air_date"], category: Category.find_by(name: genre), director: director)
      data["seasons"].each do |el|
        season_s.getSeason(el["season_number"], serial.id, id, p_s, series_sc)
      end
    end

    def getCredits(id)
      url = "https://api.themoviedb.org/3/tv/#{id}/credits?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&append_to_response=#{@guest_id}"
      JSON.parse(URI.open(url).read)
    end
  end
end