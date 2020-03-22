# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # GET /resource/sign_up
  def new
    super do |resource|
      resource.email = params.dig(:user, :email)
    end
  end
end
