class StudentsController < ApplicationController
  def index
    all_students = Student.all
    respond_to do |format|
      format.html do
        render 'index.html.erb', locals: { students: all_students }
      end
      format.json do
        render json: all_students
      end
    end
  end

  def highest_gpa
    highest_student = Student.order(gpa: :DESC).first
    respond_to do |format|
      format.html do
        render 'highest_gpa.html.erb', locals: { highest_gpa_student: highest_student }
      end
      format.json do
        render json: highest_student
      end
    end
  end

  def show
    found_student = Student.find(params[:id])
    respond_to do |format|
      format.html do
        render 'show.html.erb', locals: { student: found_student }
      end
      format.json do
        render json: found_student
      end
    end
  end

  def new
    render 'new.html.erb', locals: { student: Student.new }
  end

  def create
    begin
      #student = Student.create(name: params[:student].fetch(:name),
      #                    course_id: params[:student].fetch(:course_id),
      #                          gpa: params[:student].fetch(:gpa))
      student = Student.create(student_params)
      respond_to do |f|
        f.html do
          redirect_to "/students/#{student.id}"
        end
        f.json do
          render json: student
        end
      end
    rescue ActionController::ParameterMissing => error
      render json: { error: error.message }, status: 422
    end
  end

  def update
    student = Student.find(params[:id])

    student.course_id = params[:course_id] if params[:course_id].present?
    student.name      = params[:name]      if params[:name].present?
    student.gpa       = params[:gpa]       if params[:gpa].present?
    student.save

    render json: student
  end

  def most_common_name
    render json: Student.group(:name).order('count_name DESC').count(:name).take(params.fetch(:limit, 5))
  end

  def new_additions
    render json: Student.where(created_at: [((1.day.ago)..(Time.now))])
  end

  def destroy
    if Student.exists?(params[:id])
      Student.destroy(params[:id])
      render json: { message: 'destroyed' }, status: 200
    else
      render json: { error: 'Student not found' }, status: 404
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :gpa, :course_id)
  end
end
