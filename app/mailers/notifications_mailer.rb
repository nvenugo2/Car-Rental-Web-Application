class NotificationsMailer < ApplicationMailer
  default from: "expresscarsinc@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Express Cars')
  end
end
