class AddCarstatusToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :carstatus, :string
  end
end
