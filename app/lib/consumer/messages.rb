class Consumer::Messages < Rabbitmq::Consumer
  subscription_queue 'messages'

  def on_receive(properties, payload, delivery_info = nil)
    return if payload.nil?

    message = Message.find_or_initialize_by(payload)
    raise StandardError, message.errors.messages unless message.save
    message.reindex

    rescue ActiveRecord::RecordNotUnique
      Rails.logger.error 'The record is not unique, please try again'
  end
end