class StudentsController < ApplicationController

  def create
    @student = Student.new(student_params)
  end

  def show
    @student = Student.find_by(id: params[:id])
    render json: @student
  end

  def index
    @students = Student.where(teacher_id: params[:id])
    render json: @students
  end

  private

  def student_params
    require(:student).permit(:first_name, :last_name, :username, :password, :password_confirmation)
  end

end
