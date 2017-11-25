class AddHeadSortOrderToTrain < ActiveRecord::Migration
  def change
    add_column :trains, :head_sort, :boolean, default: false
  end
end
