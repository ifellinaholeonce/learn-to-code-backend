class UsersController < ApplicationController

  def show
    render json: { type: current_user.type, id: current_user.id }
  end

end