class TeachersController < ApplicationController

  has_secure_password

  def create
    @teacher = Teacher.new(teacher_params)
  end

  def show
    @teacher = Teacher.find_by(id: params[:id])
  end

  private

  def teacher_params
    require(:teacher).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
