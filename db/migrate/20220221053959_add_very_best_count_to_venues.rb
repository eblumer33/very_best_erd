class AddVeryBestCountToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :very_bests_count, :integer
  end
end
