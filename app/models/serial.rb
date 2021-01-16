class Serial < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include ElasticMyAnalyzer
  
  belongs_to :category
  belongs_to :director
  has_many :seasons

  settings ES_SETTING do
    mappings dynamic: 'true' do
      indexes :name, analyzer: 'my_analyzer'
    end
  end

end
