class ApplicationController < ActionController::API
  include ActionController::Cookies

rescue_from ActionController::RecordInvalid, with: :render_unprocessable_entity_response
rescue_from ActionController::RecordNotFound, with: :render_not_found_response

private

def render_unprocessable_entity_response(invalid)
  render json: {errors: invalid.record.errors.full_messsage}, status: :unprocessable_entity
end

def render_not_found_response(invalid)
  render json: {error: "#{invalid.model} not found"}, status: :not_found
end

end
  
