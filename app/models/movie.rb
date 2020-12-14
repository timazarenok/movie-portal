require 'elasticsearch/model'
require '/home/ghto/Desktop/movie-portal/lib/elastic_my_analyzer.rb'

class Movie < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include ElasticMyAnalyzer

  belongs_to :category
  belongs_to :director
  has_many :countries, through: :movies_country
  has_many :movies_actor
  has_many :actors, through: :movies_actor

  settings ES_SETTING do
    mappings dynamic: 'true' do
      indexes :name, analyzer: 'my_analyzer'
    end
  end

  def as_indexed_json(params = {})
    {
      name: name,
      image: image,
      description: description,
      clip: clip,
      release_date: release_date,
      duration: duration,
      category_id: category_id,
      director_id: director_id 
    }
  end

  def self.search_published(query)
    self.__elasticsearch__.search(query: {
      bool: {
        must: {
          multi_match: {
            query: query,
            fields: %w(name full_name),
            operator: 'and'
          }
        },
      },
    }).results
  end

end
