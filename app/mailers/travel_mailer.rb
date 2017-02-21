class TravelMailer < ApplicationMailer
  def new_inquiry( from, to, date, people, info )
    @from = from
    @to = to
    @date = date
    @people = people
    @info = info.split( ' ' )

    mail to: "ekvitko@qrpgroup.com",
         subject: 'Travel Inquiry - Soul Bazaar'
  end
end
