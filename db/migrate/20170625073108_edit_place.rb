class EditPlace < ActiveRecord::Migration[5.0]
  def change
    change_table :places do |t|
      t.remove :location
      t.float :long
      t.float :lat
    end
  end
end
