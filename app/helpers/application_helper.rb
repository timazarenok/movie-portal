module ApplicationHelper
  def is_exist(attribute)
    return "no-info" if attribute.nil? || attribute == ""
    attribute
  end
end
