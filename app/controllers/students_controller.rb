class StudentsController < ApplicationController

  def create
    @teacher = Teacher.find(1)
    @student = @teacher.students.new(student_params)

    if @student.save
      render json: @student, status: 201
    else
      render plain: "Invalid student", status: 400
    end
  end

  def index
    @students = Student.where(teacher_id: 1)
    response = @students.map do |student|
      moves = {student: student, moves: student.moves}
    end

    render json: response
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :password)
  end

end
