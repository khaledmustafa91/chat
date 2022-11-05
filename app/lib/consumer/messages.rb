class Consumer::Messages < Rabbitmq::Consumer
  subscription_queue 'messages'

  def on_receive(properties, payload, delivery_info = nil)
    return if payload.nil?

    message = Message.new(payload)
    raise StandardError, message.errors.messages unless message.save
    message.reindex
  end
end