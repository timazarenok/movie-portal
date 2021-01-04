class CategoryScrapper
  def initialize(service)
    @guest_id = service.guest_id
    @url = "https://api.themoviedb.org/3/genre/movie/list?api_key=#{ENV['TMDB_API_KEY']}&language=en-US"
  end

  def getCategory

  end

  def getCategories
    
    data = JSON.parse(URI.open(@url).read) 
    data["genres"].each do |category| 
      Category.create(name: category["name"])
    end
  end
end