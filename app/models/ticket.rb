class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  belongs_to :departure_station, class_name: 'RailwayStation'
  belongs_to :destination_station, class_name: 'RailwayStation'
end
