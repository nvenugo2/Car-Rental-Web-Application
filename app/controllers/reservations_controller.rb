class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
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

    if current_user=='Customer'
      @reservations = Reservation.where("user_id = :user_id, current = :current", {user_id: current_user_id, current: false})
    else
      @reservations= Reservation.where("current = :current", {current: false})
      end
  end

  def currentreservations
    if current_user=='Customer'
      @reservations= Reservation.where("current = :current and user_id = :user_id", {current: true, user_id: current_user.id })
    else
      @reservations = Reservation.where("current = :current", {current: true})
    end
  end

  def checkout
    @reservation = Reservation.find(params[:id])
    @reservation.update_attribute(:status, true)
    redirect_to '/currentreservations'
  end

  def checkin
    @reservation = Reservation.find(params[:id])
    @reservation.update_attribute(:current, false)
    @reservation.update_attribute(:end_time, DateTime.now)
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
