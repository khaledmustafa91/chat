# frozen_string_literal: true

class UpdateChatMessageCountJob < ApplicationJob
  queue_as :default

  def perform
    Chats::UpdateMessageCount.call
  end
end
