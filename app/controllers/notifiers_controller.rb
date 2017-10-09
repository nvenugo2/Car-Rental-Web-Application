class NotifiersController < ApplicationController


  def new
    @notifier = Notifier.new
  end

  def create
    @notifier = Notifier.new(notifier_params)
    if @notifier.save
      redirect_to '/customer'
    else
      render 'new'
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  private
  def notifier_params
    params.require(:notifier).permit(:user_id, :car_id, :status)
  end
end

