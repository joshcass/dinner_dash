class NotificationMessage
  include ActionView::Helpers

  def initialize
    @client = Twilio::REST::Client.new(Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token)
  rescue Twilio::REST::RequestError
  end

  def welcome(name, phone)
    @client.messages.create from: '+17203308656', to: "+1#{phone}", body: "Welcome to Bluer Bottle Coffee #{name}!"
  rescue Twilio::REST::RequestError
  end

  def order(name, phone, cost)
    @client.messages.create from: '+17203308656', to: "+1#{phone}", body: "Hi #{name}, your Bluer Bottle Coffee order has been recieved. The total cost is #{number_to_currency cost}. Thank you for shopping with us!"
  rescue Twilio::REST::RequestError

  end

  def order_status_update(name, phone, status)
    @client.messages.create from: '+17203308656', to: "+1#{phone}", body: "Hi #{name}, we thought you'd like to know that your Bluer Bottle Coffee order status has been updated to #{status}."
  rescue Twilio::REST::RequestError
  end
end

