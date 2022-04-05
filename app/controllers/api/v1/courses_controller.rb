class API::V1::CoursesController < API::BaseController
  before_action :set_course, only: [:show, :update, :destroy]

  def index
    @courses = Course.includes(sections: :lessons)

    render json: CourseSerializer.new(@courses).serializable_hash
  end

  def show
    render json: CourseSerializer.new(@course).serializable_hash
  end

  def create
    @course = Course.new(course_params)

    render json: CourseSerializer.new(@course), status: :created if @course.save!
  end

  def update
    render json: CourseSerializer.new(@course) if @course.update!(course_params)
  end

  def destroy
    @course.destroy
  end

  private

  def set_course
    @course = Course.find_by!(slug: params[:slug])
  end

  def course_params
    params.require(:course).permit(:name, :teacher_name, :description,
                                   sections_attributes: [
                                     :id, :name, :position, :_destroy,
                                     { lessons_attributes: [ :id, :name, :description, :content, :position, :_destroy] }
                                   ])
  end
end
