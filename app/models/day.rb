class Day < ApplicationRecord
  has_many :meals, -> { order(:time) }, dependent: :destroy

  def pp
    date.strftime("%A %b %d, %Y")
  end

end
