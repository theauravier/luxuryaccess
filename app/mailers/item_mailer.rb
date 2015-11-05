class ItemMailer < ApplicationMailer
  def add_confirmation(item)
    @item = item
    mail(to: @item.owner.email, subject: "Success : your item have been added to Luxury Access")
  end

end
