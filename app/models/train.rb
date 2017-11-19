class Train < ActiveRecord::Base
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  has_many :carriage

  validates :number, presence: true
  validates :number, uniqueness: true

  def carriages_count_by_type
    self.carriage.group(:variant).count
  end

  def seats_count_by_type(carriage_type, seat_type)
    self.carriage.where(variant: carriage_type).sum(seat_type)
  end


end
