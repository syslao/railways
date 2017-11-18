class Wagon < ActiveRecord::Base
  belongs_to :train

  VARIANT = {economy: 'плацкарт', business: 'купе'}.freeze

  validates :variant, presence: true
  validates :top_seats, presence: true
  validates :bottom_seats, presence: true
end