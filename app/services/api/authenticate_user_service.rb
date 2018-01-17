class Api::AuthenticateUserService
  def initialize(login, api_key)
    @login, @api_key = login, api_key
  end

  def execute
    return false unless login_and_api_key_valid?
    return false unless authenticate_user
    return false unless verify_api_access

    @user
  end

  private

  def login_and_api_key_valid?
    @login.present? && @api_key.present?
  end

  def authenticate_user
    return false unless @user = User.find_by(:login => @login)
    @user.authenticate(@api_key)
  end

  def verify_api_access
    @user.api_access?
  end
end
