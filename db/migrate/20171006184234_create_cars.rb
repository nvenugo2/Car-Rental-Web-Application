class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :manufacturer, null: false
      t.string :model, null: false
      t.string :style, null: false
      t.float :hourly_rate, null: false
      t.text :location, null: false
      t.string :license_plate
      t.string :status
      t.string :carstatus, :default => 'Available'
      t.timestamps
    end
  end
end
