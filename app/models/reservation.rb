class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validate :check_user_made_reservation_at_same_time
  validate :check_car_reservation_made_at_same_time


  validate :start_time_end_time_validate
  validate :time_difference_more_than_1
  validate :start_time_check
  validate :time_difference_less_than_10
  validate :start_time_is_beyond_7days





  def start_time_end_time_validate
    if start_time >= end_time
      errors.add(:end_time, "must be after start time")
    end
  end

  def time_difference_more_than_1
    if ((((end_time - start_time)/1.minute).to_i) < 60 && (((end_time - start_time)/1.minute).to_i) > 0)
      errors.add(:end_time, "and start time - minimum booking is 1 hour")
    end
  end


  def time_difference_less_than_10
    if (((end_time - start_time)/1.hour).to_i) > 10
      errors.add(:end_time, "and start time - maximum booking is 10 hours")
    end
  end

  def start_time_check
    if start_time < DateTime.now
      errors.add(:start_time, "should be today or later")
    end
  end

  def start_time_is_beyond_7days
    if start_time > 7.days.from_now
      errors.add(:start_time, "should be 7 days or lesser from now")
    end
  end

  def check_user_made_reservation_at_same_time
    errors.add(:start_time, "and end time can't be accepted as another car is already booked.") unless Reservation.where("(? = user_id) AND (? = current)", user_id, current).count == 0
  end


  def check_car_reservation_made_at_same_time
    errors.add(:start_time, "and end time specified is not available for this car.\n Please choose another timing for this car or change this car") unless Reservation.where("(? = car_id) AND (start_time BETWEEN ? AND ? )AND (end_time BETWEEN ? AND ?) AND (? = current)", car_id, start_time, end_time,start_time, end_time, current).count == 0
  end

end