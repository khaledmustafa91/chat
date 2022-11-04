class UpdateApplicationChatCountJob < ApplicationJob
  queue_as :default

  def perform
    Applications::UpdateChatCount.call
  end
end
