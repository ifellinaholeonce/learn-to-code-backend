class StudentsController < ApplicationController

  def create
    @student = Student.new(student_params)
  end

  def index
    puts "The teacher id parameters: #{params}"
    @students = Student.where(teacher_id: 1)
    render json: @students
  end

  private

  def student_params
    require(:student).permit(:first_name, :last_name, :username, :password, :password_confirmation)
  end

end
