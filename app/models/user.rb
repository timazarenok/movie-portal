class User < ApplicationRecord
  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: [:user, :editor, :admin]

  def assign_default_role
    self.add_role(:user) if self.role.blank?
  end
  
end
