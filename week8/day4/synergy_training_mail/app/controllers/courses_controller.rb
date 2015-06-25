class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    per_page = 10

    offset   = (params.fetch(:page, 1).to_i * per_page) - per_page

    @courses = Course.limit(params.fetch(:limit, per_page))
                     .offset(offset)
  end

  def show
    @course = Course.find(params[:id])
    employees = Employee.where(company_id: @course.location.company.id)
    enrolled_employees = @course.employees
    @non_enrolled_employees = employees - enrolled_employees
  end

  def enroll
    ec = EmployeeCourse.new(course_id: params[:id], employee_id: params[:employee_id])
    if ec.save
      message = { notice: 'Employee successfully enrolled!' }
    else
      message = { alert: 'Employee already enrolled!' }
    end
    redirect_to course_path(params[:id]), message
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :description, :enrollment_cap, :location_id)
    end
end
