class ContactController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      ContactMail.contact_mail(@contact).deliver
    else
      render 'new'
    end
  end
end
