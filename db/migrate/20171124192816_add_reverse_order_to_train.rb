class AddReverseOrderToTrain < ActiveRecord::Migration
  def change
    add_column :trains, :reverse_order, :boolean, default: false
  end
end
