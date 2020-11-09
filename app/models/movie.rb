class Movie < ApplicationRecord
  belongs_to :category
  belongs_to :director
  has_many :countries, through :movies_country
  has_many :actors, through :movies_actor
end
