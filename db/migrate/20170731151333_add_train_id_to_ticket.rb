class AddTrainIdToTicket < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :train
  end
end
