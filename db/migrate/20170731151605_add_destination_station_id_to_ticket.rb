class AddDestinationStationIdToTicket < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :destination_station
  end
end
