class Serial < ApplicationRecord
  belongs_to :category
  belongs_to :director
  has_many :seasons
end
