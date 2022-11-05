# frozen_string_literal: true

class Chat < ApplicationRecord
  has_many :messages
  belongs_to :application

  before_validation :set_chat_number, on: :create

  scope :by_application_token, ->(token) { joins(:application).where(applications: { token: token }) }

  def set_chat_number
    return unless application_id.present?

    max_number = self.class.where(application_id: application_id).maximum(:chat_number) || 0

    self.chat_number = max_number + 1
  end
end
