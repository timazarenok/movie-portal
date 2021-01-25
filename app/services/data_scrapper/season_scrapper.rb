module DataScrapper
  class SeasonScrapper
    def initialize(service)
      @guest_id = service.guest_id
    end

    def getSeason(season_number, sid, serial_id, p_s, series_sc)
      url = "https://api.themoviedb.org/3/tv/#{serial_id}/season/#{season_number}?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&append_to_response=#{@guest_id}"
      data = JSON.parse(URI.open(url).read)
      credits = getCredits(season_number, serial_id)
      season = Season.create(name: data["name"], description: data["overview"], image: data["poster_path"], number: data["season_number"], serial: Serial.find(sid))
      p_s.set_season_actors(season.id, credits["cast"])
      data["episodes"].each do |el|
        series_sc.getSeries(el["episode_number"], serial_id, season.id, season_number)
      end
    end

    def getCredits(season_number, serial_id)
      url = "https://api.themoviedb.org/3/tv/#{serial_id}/season/#{season_number}/credits?api_key=#{ENV['TMDB_API_KEY']}&language=en-US"
      JSON.parse(URI.open(url).read)
    end
  end
end