class AddVeryBestCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :very_bests_count, :integer
  end
end
