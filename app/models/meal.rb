class Meal < ApplicationRecord
  belongs_to :day

  def time_of_day
    Time.new.at_midnight.advance(minutes: minutes_since_midnight || 0)
  end

  def time_of_day=(val)
    self.minutes_since_midnight = ((val - Time.new.at_midnight) / 60).floor
  end

  def time_string
    time_of_day.strftime("%I:%M%p")
  end

end
