class Wish < ApplicationRecord
  belongs_to :user
  belongs_to :wishable, polymorphic: true
end
