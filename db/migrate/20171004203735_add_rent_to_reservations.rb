class AddRentToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :rent, :float
  end
end
