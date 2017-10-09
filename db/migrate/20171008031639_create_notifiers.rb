class CreateNotifiers < ActiveRecord::Migration[5.0]
  def change
    create_table :notifiers do |t|
      t.integer :user_id
      t.integer :car_id
      t.boolean :status
      t.belongs_to :user
      t.belongs_to :car
      t.timestamps
    end
  end
end
