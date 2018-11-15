require 'net/http'
require 'uri'
require 'json'

class RecaptchaVerificationService
  
  def initialize(action, response, address)
    @action, @response, @address = action, response, address
  end

  def execute
    build_query
    verify_response
    return true if @results['success']
    persist_failure
    false
  end

  private

  def build_query
    @query = {
      :secret => Rails.application.secrets[:recaptcha][:preorder][:secret_key],
      :response => @response,
      :remoteip => @address
    }
  end

  def verify_response
    uri = URI.parse('https://www.google.com/recaptcha/api/siteverify')
    response = Net::HTTP.post_form(uri, @query)
    @results = JSON.parse(response.body)
  end

  def persist_failure
    RecaptchaFailure.create!(
      :challenge_timestamp => @results['challenge_ts'],
      :hostname => @results['hostname'],
      :address => @address,
      :error_codes => @results['error-codes'].join(', ')
    )
  end
end