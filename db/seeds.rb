# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first


url = "https://api.themoviedb.org/3/movie/3?api_key=#{ENV['TMD_TOKEN']}&language=en-US&append_to_response=#{ENV['GUEST_SESSION_ID']}&page=1}"
data = JSON.parse(URI.open(url).read) 


Director.__elasticsearch__.create_index!(force: true)
Actor.__elasticsearch__.create_index!(force: true)
Serial.__elasticsearch__.create_index!(force: true)
