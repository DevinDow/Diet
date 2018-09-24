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

  def proteins
    (categories && categories[2]) || 0
  end

  def carbs
    (categories && categories[3]) || 0
  end

  def fats
    (categories && categories[4]) || 0
  end

  def seeds
    (categories && categories[5]) || 0
  end

  def oils
    (categories && categories[6]) || 0
  end

end
