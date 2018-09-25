class Meal < ApplicationRecord
  belongs_to :day

  def time_of_day
    Time.new.at_midnight.advance(minutes: time).strftime("%I:%M%p")
  end

end
