class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :img_url
      t.string :model
      t.string :description
      t.float :price

      t.timestamps
    end
  end
end
