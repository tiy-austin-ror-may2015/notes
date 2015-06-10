class StudentsController < ApplicationController

  def most_common_name
    @student = Student.group(:name).order('count_name DESC').count(:name).take(params.fetch(:limit, 5))
  end

  def new_additions
    @students = Student.where(created_at: [((1.day.ago)..(Time.now))])
  end

  def highest_gpa
    @highest_student = Student.order(gpa: :DESC).first
  end

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    student = Student.create(student_params)
    redirect_to student
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    student = Student.find(params[:id])
    student.update(student_params)
    student.save
    redirect_to student
  end

  def destroy
    if Student.exists?(params[:id])
      Student.destroy(params[:id])
      redirect_to students_path
    else
      redirect_to students_path
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :gpa, :course_id)
  end
end
