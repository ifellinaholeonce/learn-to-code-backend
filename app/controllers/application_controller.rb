class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  # Make the current_user accessible to all controllers
  def current_user
    if session[:user_id]
      student = Student.find(session[:user_id])
      teacher = Teacher.find(session[:user_id])
      @current_user = student || teacher
    end
  end
  helper_method :current_user

  # Redirect to the login page (Used on specific routes)
  def authorize
    redirect_to '/login' unless current_user
  end

  private
    # def cart
      # value = cookies[:cart] || JSON.generate({})
    #   @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
    # end
    # helper_method :cart

    # def update_cart(new_cart)
    #   cookies[:cart] = {
    #     value: JSON.generate(new_cart),
    #     expires: 10.days.from_now
    #   }
    #   cookies[:cart]
    # end

end
