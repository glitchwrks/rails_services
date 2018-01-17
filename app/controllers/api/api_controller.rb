class Api::ApiController < ApplicationController

  layout false

  before_action :authenticate

  private

  def authenticate
    if user = authenticate_with_http_basic { |login, api_key| Api::AuthenticateUserService.new(login, api_key).execute }
      @current_user = user
    else
      request_http_basic_authentication
    end
  end
end
