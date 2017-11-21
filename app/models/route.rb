class Route < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :trains
  has_many :railway_stations, through: :railway_stations_routes
  
  validates :name, presence: true
  validates :railway_station_id, uniqueness: { scope: :route_id }
end
