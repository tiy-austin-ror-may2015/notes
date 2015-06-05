class StudentsController < ApplicationController
  def index
    render json: Student.all
  end

  def show
    begin
      render json: Student.find(params[:id])

    rescue ActiveRecord::RecordNotFound => error
      render json: { error: error.message }, status: 404

    rescue StandardError => error
      render json: { error: error.message }, status: 422
    end
  end

  def create
    begin
      student = Student.create(name: params.fetch(:name),
                          course_id: params.fetch(:course_id),
                                gpa: params.fetch(:gpa))
      render json: student
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

  def highest_gpa
    render json: Student.order(gpa: :DESC).first
  end

  def most_common_name
    render json: Student.group(:name).order('count_name DESC').count(:name).take(params.fetch(:limit, 5))
  end

  def destroy
    if Student.exists?(params[:id])
      Student.destroy(params[:id])
      render json: { message: 'destroyed' }, status: 200
    else
      render json: { error: 'Student not found' }, status: 404
    end
  end

end
