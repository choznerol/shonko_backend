class API::V1::CoursesController < API::BaseController
  before_action :set_course, only: [:show, :update, :destroy]

  def index
    @courses = Course.all

    render json: @courses
  end

  def show
    render json: @course
  end

  def create
    @course = Course.new(course_params)

    render json: @course, status: :created if @course.save!
  end

  def update
    render json: @course if @course.update!(course_params)
  end

  def destroy
    @course.destroy
  end

  private

  def set_course
    @course = Course.find_by!(slug: params[:slug])
  end

  def course_params
    params.require(:course).permit(:name, :teacher_name, :description, sections_attributes: [:id, :name, :position, :_destroy])
  end
end
