class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.string :variant
      t.integer :top_seats
      t.integer :bottom_seats

      t.timestamps null: false
    end

    add_belongs_to :wagons, :train, index: true
  end
end
