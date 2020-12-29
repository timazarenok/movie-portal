ActiveAdmin.register Movie do

  permit_params do
    permitted = [:name, :image, :description, :clip, :release_date, :duration, :category_id, :country_id, :director_id, countries: [:country_id] ]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

end
