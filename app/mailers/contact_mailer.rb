class ContactMailer < ApplicationMailer
  def new_contact( name, email, body )
    @name = name
    @email = email
    @body = body

    mail to: "soubazinfo@gmail.com",
         subject: 'New Contact - Soul Bazaar'
  end
end
