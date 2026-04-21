module HealthEntriesHelper
  def mood_colour(mood)
    if mood >= 5
      "success"
    elsif mood >= 3
      "warning"
    else
      "danger"
    end
  end
end
