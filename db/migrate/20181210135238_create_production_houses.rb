class CreateProductionHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :production_houses do |t|
      t.string :name
      t.timestamps
    end
  end
end
