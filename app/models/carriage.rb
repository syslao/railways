class Carriage < ActiveRecord::Base
  belongs_to :train

  TYPES = {
    EconomyCarriage:  'плацкарт',
    CoupeCarriage:    'купе',
    BusinessCarriage: 'бизнес',
    SittingCarriage:  'сидячий'
  }.freeze
  
  validates :top_seats, presence: true
  validates :bottom_seats, presence: true
end