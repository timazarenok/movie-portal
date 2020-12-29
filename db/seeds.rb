# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first

require('/home/ghto/Desktop/movie-portal/app/services/movies/movie_scrapper.rb')

MovieScrapper.getCountries
MovieScrapper.getCredits(5)

Director.__elasticsearch__.create_index!(force: true)
Actor.__elasticsearch__.create_index!(force: true)
Serial.__elasticsearch__.create_index!(force: true)
Movie.__elasticsearch__.create_index!(force: true)


