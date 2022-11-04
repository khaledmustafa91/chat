class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :message_number
      t.belongs_to :chat
      t.timestamps
    end
  end
end
