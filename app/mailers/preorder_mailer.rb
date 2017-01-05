class PreorderMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  def confirmation(preorder)
    @preorder = preorder
    @confirm_path = confirm_preorders_path(:token => @preorder.confirmation_token)

    mail(
      :to => @preorder.email,
      :subject => "#{@preorder.project.printable_name} Preorder Confirmation",
    )
  end
end
