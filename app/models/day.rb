class Day < ApplicationRecord
  has_many :meals, -> { order(:time) }, dependent: :destroy
end
