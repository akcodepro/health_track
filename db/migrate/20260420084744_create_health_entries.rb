class CreateHealthEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :health_entries do |t|
      t.integer :mood
      t.integer :energy
      t.decimal :sleep_hours
      t.decimal :water_litres
      t.text :notes
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
