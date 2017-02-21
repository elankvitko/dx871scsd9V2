class ContactController < ApplicationController
  before_action :authenticate_user!
  def create
    if request.xhr?
      if params[ "airport-from" ]
        TravelMailer.new_inquiry( params[ 'airport-from' ], params[ 'airport-to' ], params[ 'date' ], params[ 'qty' ], params[ 'info' ] ).deliver_now
        render partial:'success', layout: false
      else
        ContactMailer.new_contact( params[ 'name' ], params[ 'email' ], params[ 'body' ] ).deliver_now
        render partial:'success', layout: false
      end
    end
  end
end
