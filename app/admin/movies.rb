ActiveAdmin.register Movie do

  permit_params :name, :image, :description, :clip, :release_date, :duration, :category_id, :director_id

end
