class Search < ActiveRecord::Base

  def self.find_train(departure_station, arrival_station)
    return false if departure_station == arrival_station
    Train.joins(route: :railway_stations).where(
      railway_stations: { id: departure_station, id: arrival_station })
  end
end
