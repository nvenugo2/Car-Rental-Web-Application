class Car < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  def car_name
    "#{manufacturer}: #{model}"
  end

  def car_number_name
    "#{manufacturer}: #{model} - #{license_plate}"
  end
end
