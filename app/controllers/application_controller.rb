class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordNotFound, with: :render_error
  
  private

  def render_error
    render json: { error: "not found" }, status: :not_found
  end

end
