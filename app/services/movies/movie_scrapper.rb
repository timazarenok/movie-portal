class MovieScrapper
  def self.getMovies
    (1..100).each do |i|
      url = "https://api.themoviedb.org/3/movie/#{i}?api_key=#{ENV['TMD_TOKEN']}&language=en-US&append_to_response=#{ENV['GUEST_SESSION_ID']}}"
      data = JSON.parse(URI.open(url).read) 
    end
  end

  def self.getCountries
    url = "https://api.themoviedb.org/3/configuration/countries?api_key=#{ENV['TMD_TOKEN']}&language=en-US&append_to_response=#{ENV['GUEST_SESSION_ID']}"
    data = JSON.parse(URI.open(url).read) 
    data.each do |country| 
      Country.create(name: country["english_name"]) if country["english_name"].nil?
    end
  end

  def self.getCredits(id)
    url = "https://api.themoviedb.org/3/movie/#{id}/credits?api_key=#{ENV['TMD_TOKEN']}&language=en-US&append_to_response=#{ENV['GUEST_SESSION_ID']}"
    data = JSON.parse(URI.open(url).read)
    data["cast"].each do |el|
        getPerson(el["id"], el["known_for_department"])
      end
  end

  def self.getPerson(id, type)
    url = "https://api.themoviedb.org/3/person/#{id}?api_key=#{ENV['TMD_TOKEN']}&language=en-US&append_to_response=#{ENV['GUEST_SESSION_ID']}"
    data = JSON.parse(URI.open(url).read)
    
    case type
      when "Acting"
        obj = Actor.create(full_name: data["name"], biography: data["biography"], date_of_birth: data["birthday"], image: data["profile_path"], place_of_birth: data["place_of_birth"])
      when "Directing"
        obj = Director.create(full_name: data["name"], biography: data["biography"], date_of_birth: data["birthday"], image: data["profile_path"], place_of_birth: data["place_of_birth"])
    end
  end

end