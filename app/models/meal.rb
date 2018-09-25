class Meal < ApplicationRecord
  belongs_to :day

  def pp
    time.strftime("%I:%M%p %Z")
  end

end
