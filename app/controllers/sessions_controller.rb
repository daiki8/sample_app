class SessionsController < ApplicationController
  def new
    user = User.find_by(email: params[:session][:email],
                      password: params[:session][:password])
    if user && user.authenticate(params[:session][:password])
      #
    else
      render 'new'
    end
  end
  
  def destroy
  end
end
