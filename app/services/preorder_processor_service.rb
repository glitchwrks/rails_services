require 'securerandom'
require 'sanitize'

class PreorderProcessorService
  def initialize(preorder)
    @preorder = preorder
  end

  def execute
    sanitize_fields
    generate_confirmation_token
    send_confirmation_email
    @preorder.save!
  end

  private

  def sanitize_fields
    @preorder.name = Sanitize.clean(@preorder.name)
    @preorder.email = Sanitize.clean(@preorder.email)
    @preorder.boards = Sanitize.clean(@preorder.boards)
    @preorder.kits = Sanitize.clean(@preorder.kits)
    @preorder.assembled = Sanitize.clean(@preorder.assembled)
  end

  def generate_confirmation_token
    @preorder.confirmation_token = SecureRandom.urlsafe_base64
  end

  def send_confirmation_email
    PreorderMailer.confirmation(@preorder).deliver_now
  end
end