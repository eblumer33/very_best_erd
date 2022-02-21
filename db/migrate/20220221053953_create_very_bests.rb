class CreateVeryBests < ActiveRecord::Migration[6.0]
  def change
    create_table :very_bests do |t|
      t.integer :user_id
      t.integer :dish_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
