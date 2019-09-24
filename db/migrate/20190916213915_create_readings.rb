class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.references :thermostat, null: false
      t.integer :tracking_number, default: 0
      t.float :temperature, default: 0
      t.float :humidity, default: 0
      t.float :battery_charge, default: 0

      t.timestamps
    end
  end
end
