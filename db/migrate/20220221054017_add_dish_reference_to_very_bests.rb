class AddDishReferenceToVeryBests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :very_bests, :dishes
    add_index :very_bests, :dish_id
    change_column_null :very_bests, :dish_id, false
  end
end
