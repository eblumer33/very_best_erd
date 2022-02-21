class AddVenueReferenceToVeryBests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :very_bests, :venues
    add_index :very_bests, :venue_id
    change_column_null :very_bests, :venue_id, false
  end
end
