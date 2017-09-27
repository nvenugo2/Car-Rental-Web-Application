class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.role == 'Customer'
      redirect_to '/customer', :notice => "Login successful!"
      elsif user.role == 'Admin'
        redirect_to '/admin'
      else
        redirect_to '/superadmin'
       end
    else
      render :new
      flash.alert = "Email or password invalid!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
