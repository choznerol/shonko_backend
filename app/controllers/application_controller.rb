class ApplicationController < ActionController::API
  include Rendering

  rescue_from ActiveRecord::RecordNotFound, with: :respond_record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :respond_record_invalid

  def respond_record_not_found(exception)
    message = get_exception_message(exception, HTTP_MESSAGE_RECORDNOTFOUND)
    render json: get_result_json(HTTP_CODE_RECORDNOTFOUND, message),
           status: HTTP_CODE_RECORDNOTFOUND
  end

  def respond_record_invalid(exception)
    exception = OpenStruct.new(message: exception.record&.errors || HTTP_MESSAGE_UNPROCESSABLEENTITY)
    message = get_exception_message(exception, HTTP_MESSAGE_UNPROCESSABLEENTITY)
    render json: get_result_json(HTTP_CODE_UNPROCESSABLEENTITY, message),
           status: HTTP_CODE_UNPROCESSABLEENTITY
  end
end
