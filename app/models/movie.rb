class Movie < ApplicationRecord
  belongs_to :category
  belongs_to :director
  has_many :countries, through: :movies_country
  has_many :movies_actor
  has_many :actors, through: :movies_actor
  has_many :likes, as: :likeable
  has_many :users, through: :like

  def liked?(user)
    !!self.likes.find{ |like| like.user_id == user.id }
  end

end
