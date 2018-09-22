class Meal < ApplicationRecord
  belongs_to :day

  def pp
    time.strftime("%I:%M%p %Z")
  end

  def veggies
    (categories && categories[0]) || 0
  end

  def fruits
    (categories && categories[1]) || 0
  end

end
