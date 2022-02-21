class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :dish_name
      t.string :cuisine_type

      t.timestamps
    end
  end
end
