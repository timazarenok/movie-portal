class Season < ApplicationRecord
  belongs_to :serial
  has_many :series
  has_many :actors, through: :seasons_actor
end
