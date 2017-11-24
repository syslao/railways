class Train < ActiveRecord::Base
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  has_many :carriage

  validates :number, presence: true
  validates :number, uniqueness: true

  def carriages_count_by_type
    carriage.group(:type).count
  end

  def seats_count_by_type(carriage_type, seat_type)
    carriage.where(type: carriage_type).sum(seat_type)
  end

  def numeration_order
    reverse_order ? carriage.reverse : carriage
  end

end
