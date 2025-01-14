class Signup < ApplicationRecord
  validates :time, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 24 }

  belongs_to :camper
  belongs_to :activity
end
