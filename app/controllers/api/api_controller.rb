class Api::ApiController < ApplicationController

  layout false

  before_action :authenticate
  before_action :only_respond_to_json

  private

  def authenticate
    if user = authenticate_with_http_basic { |login, api_key| Api::AuthenticateUserService.new(login, api_key).execute }
      @current_user = user
    else
      request_http_basic_authentication
    end
  end

  def only_respond_to_json
    head :not_acceptable unless request.format == :json
  end
end
