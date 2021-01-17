class Director < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include ElasticMyAnalyzer

  has_many :movies

  settings ES_SETTING do
    mappings dynamic: 'true' do
      indexes :full_name, analyzer: 'my_analyzer'
    end
  end

end
