# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first

require('faker')

(1..10).each do
  Country.create(name: Faker::Nation.nationality)
  Category.create(name: Faker::Book.genre)
end

(1..5).each do
  Director.create(full_name: Faker::Name.name, biography: Faker::Lorem.paragraph(sentence_count: 15), date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 80), image: Faker::Fillmurray.image(grayscale: false, width: 200, height: 300), country: Country.order(Arel.sql('RANDOM()')).first)
end

(1..10).each do
  Movie.create(name: Faker::Movie.title, image: Faker::Fillmurray.image(grayscale: false, width: 200, height: 300), description: Faker::Lorem.paragraph(sentence_count: 20), clip: "clip", release_date: Faker::Date.in_date_period, duration: "02:03", category: Category.order(Arel.sql('RANDOM()')).first, director: Director.order(Arel.sql('RANDOM()')).first)
end

(1..20).each do
  Actor.create(full_name: Faker::Name.name, biography: Faker::Lorem.paragraph(sentence_count: 15), date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 80), image: Faker::Fillmurray.image(grayscale: false, width: 200, height: 300), country: Country.order(Arel.sql('RANDOM()')).first) 
end

(1..8).each do
  MoviesActor.create(movie: Movie.first, actor: Actor.order(Arel.sql('RANDOM()')).first) 
end

