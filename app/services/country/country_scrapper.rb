class CountryScrapper
  def initialize(service)
    @guest_id = service.guest_id
  end

  def getCountries
    url = "https://api.themoviedb.org/3/configuration/countries?api_key=#{ENV['TMD_TOKEN']}&language=en-US&append_to_response=#{ENV['GUEST_SESSION_ID']}"
    data = JSON.parse(URI.open(url).read) 
    data.each do |country|
      unless Country.exists?(name: data["english_name"])
        Country.create(name: country["english_name"]) if country["english_name"].nil? 
      end
    end
  end
end