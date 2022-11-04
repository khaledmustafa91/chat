class Chat < ApplicationRecord
  has_many :messages
  belongs_to :application

  before_validation :set_chat_number

  def set_chat_number
    return unless application_id.present?

    max_number = self.class.where(application_id: application_id).maximum(:chat_number) || 0

    self.chat_number = max_number + 1
  end
end
