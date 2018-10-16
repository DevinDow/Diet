class Day < ApplicationRecord
  has_many :meals, -> { order(:minutes_since_midnight) }, dependent: :destroy

  def day_string
    date.strftime("%A %b %d, %Y")
  end

  def totals
    t = Array.new(7, 0)
    meals.each do |m|
      m.categories.each_with_index do |c, i|
        t[i] = t[i].to_f + c.to_f
      end
    end
    t
  end

end
