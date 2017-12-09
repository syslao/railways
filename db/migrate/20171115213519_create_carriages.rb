class CreateCarriages < ActiveRecord::Migration
  def change
    create_table :carriages do |t|
      t.string :number
      t.integer :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :seats, default: 0
      t.string :type
      t.timestamps null: false
    end

    add_belongs_to :carriages, :train, index: true
  end
end