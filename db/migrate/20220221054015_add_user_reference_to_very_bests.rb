class AddUserReferenceToVeryBests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :very_bests, :users
    add_index :very_bests, :user_id
    change_column_null :very_bests, :user_id, false
  end
end
