class AddCarRefToRentals < ActiveRecord::Migration[7.0]
  def change
    add_reference :rentals, :car, null: false, foreign_key: true
  end
end
