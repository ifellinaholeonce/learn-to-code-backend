class UsersController < ApplicationController

  def show
    puts "Current user !!!!!! #{current_user.type}"
    render json: { user: current_user.type }
  end

end