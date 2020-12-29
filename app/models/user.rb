class User < ApplicationRecord
  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes
  has_many :movies, through: :likes, source: :likeable, source_type: "Movie"
  
  enum role: [:user, :editor, :admin]

  def assign_default_role
    self.add_role(:user) if self.role.blank?
  end

  def liked?(resource_type, resource_id)
    likes.exists?(likeable_type: resource_type, likeable_id: resource_id)
  end

  def add_like_to(likeable_obj)
    likes.where(likeable: likeable_obj).first_or_create
  end

  def remove_like_from(likeable_obj)
    likes.where(likeable: likeable_obj).destroy_all
  end

end