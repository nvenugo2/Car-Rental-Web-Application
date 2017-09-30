class UsermailerMailer < ApplicationMailer
	default from: 'notification@expresscarrental.com'

	def welcome_email (user)
		@user = user
		@url = 'https://expresscarrental.herokuapp.com/login'
		mail(:to => user.email,
         :subject => "Welcome to Express Car Rentals")
    end
 
end
