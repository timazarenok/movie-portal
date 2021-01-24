class User < ApplicationRecord
  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github, :facebook]
  
  has_many :likes
  has_many :wishes
  has_many :liked_movies, through: :likes, source: :likeable, source_type: "Movie"
  has_many :wished_movies, through: :wishes, source: :wishable, source_type: "Movie"
  has_one_attached :image
  
  enum role: [:user, :editor, :admin]

  def self.find_or_create_from_auth_hash(auth)
    where(provider: auth.provider, uid: auth.uid, email: auth.info.email).first_or_create! do |user|
      user.provider = auth&.provider
      user.uid = auth&.uid
      user.email = auth&.info&.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def assign_default_role
    self.role = :user if self.role.blank?
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

  def add_wish_to(wishable_obj)
    wishes.where(wishable: wishable_obj).first_or_create
  end

  def remove_wish_from(wishable_obj)
    wishes.where(wishable: wishable_obj).destroy_all
  end

  def wished?(resource_type, resource_id)
    wishes.exists?(wishable_type: resource_type, wishable_id: resource_id)
  end

end