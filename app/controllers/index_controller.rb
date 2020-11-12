class IndexController < ApplicationController
    def index
        #Country.create(name: "Belarus")
        #Category.create(name: "Comedy")
        #Director.create(full_name: "Test", biography: "rfdjknrejlfrefnm", date_of_birth: "19.06.2002", image: "rnffejnefdwed", country_id: Country.find_by(name: "Belarus").id)
        #Movie.create(name: "Movie2", description: "renhfbejfhrenferjferghtrtytuytiu", clip: "clip_test2", release_date: "31.01.2021", duration: "02:03", category_id: Category.find_by(name: "Comedy").id, director_id: Director.find_by(full_name: "Test").id)
        #Movie.create(name: "Movie3", description: "no desc", clip: "clip_test3", release_date: "26.11.2020", duration: "02:15", category_id: Category.find_by(name: "Comedy").id, director_id: Director.find_by(full_name: "Test").id)
        #Movie.create(name: "Movie4", description: "gyuiopooiuuyuiop[ojiguk", clip: "clip_test4", release_date: "21.06.2020", duration: "01:30", category_id: Category.find_by(name: "Comedy").id, director_id: Director.find_by(full_name: "Test").id)
        @movies = Movie.all.to_a
    end
end
