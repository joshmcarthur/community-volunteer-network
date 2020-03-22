class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery prepend: true, with: :exception
  before_action :http_basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name phone_number])
  end

  def after_sign_in_path_for(resource)
    flash[:missing_profile_data] = current_user.attributes["name"].blank? || current_user.phone_number.blank?
    resource.communities.count == 1 ? resource.communities.first : communities_path
  end

  private

  def http_basic_auth
    return unless ENV["HTTP_BASIC_AUTH_USERNAME"] && \
                  ENV["HTTP_BASIC_AUTH_PASSWORD"]

    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["HTTP_BASIC_AUTH_USERNAME"] && \
        password == ENV["HTTP_BASIC_AUTH_PASSWORD"]
    end
  end
end
