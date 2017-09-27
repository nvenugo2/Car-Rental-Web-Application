class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.datetime :start_time
      t.datetime  :end_time
      t.belongs_to :user
      t.belongs_to :car
      t.boolean :current, :default => true
      t.boolean :status, :default => false

      t.timestamps
    end
  end
end