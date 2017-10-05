class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      @reservation.car.update_attribute(:carstatus, 'Reserved')
      if current_user.role == 'Customer'
      redirect_to '/cars'
      elsif current_user.role == 'Admin'
        redirect_to '/admin'
      else
        redirect_to '/superadmin'
        end
    else
      render 'new'
    end
  end

  def reservationlog
      @reservations= Reservation.where("current = :current", {current: false})
   end

    def customercurrentreservation
      @custreservations= Reservation.where("current = :current and user_id = :user_id", {current: true, user_id: current_user.id })
    end

  def currentreservations
      @reservations = Reservation.where("current = :current", {current: true})
    end

    def customerhistory
      @custreservations = Reservation.where("user_id = :user_id and current = :current", {user_id: current_user.id, current: false})
    end

  def checkout
    @reservation = Reservation.find(params[:id])
    @reservation.update_attribute(:status, true)
    @reservation.update_attribute(:current, true)
    @reservation.update_attribute(:start_time, DateTime.now)
    @reservation.car.update_attribute(:carstatus, 'Checked out')
    if current_user.role == 'Customer'
      redirect_to '/customer'
    elsif current_user.role == 'Admin'
      redirect_to '/admin'
    else
      redirect_to '/superadmin'
    end
  end

  def checkin
    @reservation = Reservation.find(params[:id])
    @reservation.update_attribute(:current, 0)
    @reservation.update_attribute(:end_time, DateTime.now)
    @reservation.car.update_attribute(:carstatus, 'Available')
    if current_user.role == 'Customer'
    redirect_to '/customer'
    elsif current_user.role == 'Admin'
      redirect_to '/admin'
    else
      redirect_to '/superadmin'
  end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :car_id, :start_time, :end_time, :current, :status)
  end



end

