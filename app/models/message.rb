class Message < ApplicationRecord
  belongs_to :chat

  validates_presence_of :body
  before_validation :set_message_number

  def set_message_number
    return unless chat_id.present?

    max_number = self.class.where(chat_id: chat_id).maximum(:message_number) || 0

    self.message_number = max_number + 1
  end
end
