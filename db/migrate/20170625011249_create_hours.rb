class CreateHours < ActiveRecord::Migration[5.0]
  def change
    create_table :hours do |t|
      t.string :day
      t.integer :start
      t.integer :stop
      t.integer :place_id

      t.timestamps
    end
  end
end
