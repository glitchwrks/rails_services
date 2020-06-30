module Helpers
  module Authentication
    def http_basic_auth(login, password)
      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(login, password)
    end  
  end
end