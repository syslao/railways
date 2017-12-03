class RailwayStation < ActiveRecord::Base
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.position').uniq }

  def update_attrs(route, position, arrival_time, departure_time)
    station_route = station_route(route)
    station_route.update(position: position, arrival_time: arrival_time, departure_time: departure_time) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end
  
  def date_attr(route, attr)
     val = station_route(route).try(attr)
     val.strftime('%H:%M') if station_route(route).try(attr)    
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
