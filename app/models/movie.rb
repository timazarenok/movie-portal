require 'elasticsearch/model'

class Movie < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  belongs_to :category
  belongs_to :director
  has_many :countries, through: :movies_country
  has_many :movies_actor
  has_many :actors, through: :movies_actor

  def self.search_published(query)
    self.__elasticsearch__.search(query: {
      match: {
        name: {
          query: query
        }
      }  
    }).results
  end

end
