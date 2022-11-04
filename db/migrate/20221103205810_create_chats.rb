# frozen_string_literal: true

class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :chat_number
      t.integer :message_count
      t.belongs_to :application
      t.timestamps
    end
  end
end
