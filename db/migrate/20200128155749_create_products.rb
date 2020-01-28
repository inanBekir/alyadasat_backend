class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :unique_id
      t.string :title
      t.string :description
      t.float :price
      t.float :latitude
      t.float :longitude
      t.integer :favori_amount
      t.boolean :is_solid
      t.boolean :is_active

      t.timestamps
    end
  end
end
