class Meal < ApplicationRecord
  belongs_to :day

  def time_of_day
    Time.new.at_midnight.advance(minutes: time || 0)
  end

  def time_of_day=(val)
    self.time = ((val - Time.new.at_midnight) / 60).floor
  end

  def time_string
    time_of_day.strftime("%I:%M%p")
  end

end
