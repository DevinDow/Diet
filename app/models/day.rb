class Day < ApplicationRecord
  has_many :meals, -> { order(:minutes_since_midnight) }, dependent: :destroy

  def day_string
    date.strftime("%A %b %d, %Y")
  end

end
