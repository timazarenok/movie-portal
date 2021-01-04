# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first

require('/home/ghto/Desktop/movie-portal/app/services/category/category_scrapper.rb')
require('/home/ghto/Desktop/movie-portal/app/services/country/country_scrapper.rb')
require('/home/ghto/Desktop/movie-portal/app/services/person/person_scrapper.rb')
require('/home/ghto/Desktop/movie-portal/app/services/movies/movie_scrapper.rb')
require('/home/ghto/Desktop/movie-portal/app/services/service/service_scrapper.rb')


service = ServiceScrapper.new(ENV["TMDB_SESSION_URL"])
service.set_guest_id

person_scrapper = PersonScrapper.new(service)
category_scrapper = CategoryScrapper.new(service)
category_scrapper.getCategories
m_s = MovieScrapper.new(service)
m_s.getList(7, person_scrapper)


Director.__elasticsearch__.create_index!(force: true)
Actor.__elasticsearch__.create_index!(force: true)
Serial.__elasticsearch__.create_index!(force: true)
Movie.__elasticsearch__.create_index!(force: true)


