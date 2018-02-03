class TeachersController < ApplicationController

  def create
    @teacher = Teacher.new(teacher_params)
  end

  private

  def teacher_params
    require(:teacher).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
