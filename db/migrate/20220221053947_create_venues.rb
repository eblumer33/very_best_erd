class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :neighborhood
      t.string :state

      t.timestamps
    end
  end
end
