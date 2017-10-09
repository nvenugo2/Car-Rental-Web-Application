class NotificationMailer < ApplicationMailer

  default from: 'expresscarsinc@gmail.com'

  layout "mailer"

  def welcome_email(user)
    @user = user
    @url  = 'https://expresscarrental.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to Express Cars Inc')
  end

  def notify_email(user,car)
    @user = user
    @car = car
    @url  = 'https://expresscarrental.herokuapp.com'
    mail(to: @user.email, subject: 'Your car is now available!')
  end

end

#Rails.logger.debug("debug::" + @car.id)