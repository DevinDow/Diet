class Day < ApplicationRecord
  has_many :meals, -> { order(:minutes_since_midnight) }, dependent: :destroy

  def day_string
    date.strftime("%A %b %d, %Y") if date
  end

  def totals
    tot = Array.new(7, 0)
    meals.each do |m|
      m.categories.each_with_index do |c, i|
        tot[i] = tot[i].to_f + c.to_f
      end
    end
    tot
  end

  def targets
    targ = Array.new(7, 0)
    targ[0] = 4
    targ[1] = 3
    targ[2] = 4
    targ[3] = 3
    targ[4] = 1
    targ[5] = 1
    targ[6] = 3
    targ
  end

  def remainders
    tot = totals
    targ = targets
    rem = Array.new(7, 0)
    tot.each do |i|
      rem[i] = targ[i] - tot[i]
    end
    rem
  end

end
