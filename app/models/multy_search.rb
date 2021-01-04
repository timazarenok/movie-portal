class MultySearch
  MODELS_TO_SEARCH = [Movie, Serial, Actor, Director].freeze

  def initialize
    @raw_data = nil
    @results = nil
  end

  def search(search_word)
    save_data run_elastic(search_word)
    self
  end

  def raw_data
    @raw_data
  end
  
  def results
    @results
  end

  private

  def run_elastic(search_word)
    Elasticsearch::Model
    .search(search_query(search_word), MODELS_TO_SEARCH)
  end

  def save_data(data)
    @raw_data = data
    @results = create_answers(data)
  end

  def create_answers(data)
    data.records.map do |result|
      {
        hint: build_hint(result),
        record_type: result.class.name,
        record_id: result.id
      }
    end
  end

  def search_query(query)
    {
      query: {
        bool: {
          must: {
            multi_match: {
              query: query,
              fields: %w(name full_name),
              operator: 'and'
            }
          },
        }
      }
    }
  end

  def build_hint(record)
    {
      name: record.respond_to?(:name) ? record.name : record.full_name,
      type: hint_type(record)
    }
  end

  def hint_type(record)
    case record.class.to_s
    when 'Movie' then 'Фильм'
    when 'Serial' then 'Сериал'
    when 'Actor' then 'Актер'
    when 'Director' then 'Режиссер'
    end
  end
end