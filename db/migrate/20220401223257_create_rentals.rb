class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :price

      t.timestamps
    end
  end
end
