class AddDepartureStationIdToTicket < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :departure_station
  end
end
