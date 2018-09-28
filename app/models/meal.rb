class Meal < ApplicationRecord
  belongs_to :day

  def time_of_day
    puts "** time_of_day() time=#{time}"
    Time.new.at_midnight.advance(minutes: time || 0)
  end

  def time_of_day=(val)
    puts "** time_of_day=(#{val})"
    puts val.class
    t = Time.new(val)
    puts "*** time=(#{t})"
    self.time = ((t - Time.new.at_midnight) / 60).floor
  end

  def time_string
    time_of_day.strftime("%I:%M%p")
  end

end
