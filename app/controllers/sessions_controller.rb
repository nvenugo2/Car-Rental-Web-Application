class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.role == 'Customer'
      redirect_to '/customer'
      flash[:notice] = "Login successful!"
      elsif user.role == 'Admin'
        redirect_to '/admin'
        flash[:notice] = "Login successful!"
      else
        redirect_to '/superadmin'
        flash[:notice] = "Login successful!"
       end
    else
      flash[:notice] = "Email or password invalid!"
      render 'new'

    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
