# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  skip_before_action :verify_signed_out_user, only: :destroy

  def create
    super do |resource|
      render_json_response(
        message: 'User signed in successfully',
        data: current_user
      ) and return
    end
  end
  

  def destroy
    sign_out(current_user) if user_signed_in?

    respond_to_on_destroy
  end

  private

  def respond_to_on_destroy
    if user_signed_in?
      render_json_response(
        status: 200,
        message: 'Signed out successfully'
      )
    else
      render_json_response(
        status: 401,
        message: 'User has no active session'
      )
    end
  end

  # Helper method to render JSON responses
  def render_json_response(options = {})
    render json: {
      status: { code: options[:status] || 200, message: options[:message], data: options[:data] }
    }, status: options[:status] || :ok
  end
end
