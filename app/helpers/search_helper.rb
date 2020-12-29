module SearchHelper
  def search_result_link(result)
    case result[:record_type]
    when 'Movie'
      movie_path(result[:record_id])
    when 'Serial'
      serial_path(result[:record_id])
    when 'Actor'
      actor_path(result[:record_id])
    when 'Director'
      director_path(result[:record_id])
    end
  end
end
