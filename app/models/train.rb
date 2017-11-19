class Train < ActiveRecord::Base
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  has_many :wagon

  validates :number, presence: true
  validates :number, uniqueness: true

  def wagons_count_by_type
    self.wagon.group(:variant).count
  end

  def seats_count_by_type(wagon_type, seat_type)
    self.wagon.where(variant: wagon_type).sum(seat_type)
  end


end
