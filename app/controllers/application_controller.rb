class ApplicationController < ActionController::Base
  before_action :http_basic_auth

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
