class Actor < ApplicationRecord
  belongs_to :country
  has_many :movies, through :movies_actor
end
