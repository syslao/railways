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
  validates :number, presence: true, uniqueness: { scope: :train_id }

  before_validation :set_number
  
  private
  
  def set_number
    self.number ||=  train.carriage.maximum(:number).to_i + 1
  end

end