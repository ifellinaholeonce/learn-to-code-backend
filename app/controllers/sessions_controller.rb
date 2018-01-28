class SessionsController < ApplicationController

  def new
  end

  def create
    student = Student.authenticate_with_credentials(params[:email], params[:password])
    teacher = Teacher.authenticate_with_credentials(params[:email], params[:password])

    if user = student || teacher
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      render json: false
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
