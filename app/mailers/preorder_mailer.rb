class PreorderMailer < ApplicationMailer

  def confirmation(preorder)
    @preorder = preorder

    mail(
      :to => @preorder.email,
      :subject => "#{@preorder.project.printable_name} Preorder Confirmation",
    )
  end
end
