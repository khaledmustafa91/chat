# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Applications::Chats::MessagesController, type: :request do
  let(:application) { create(:application) }
  let(:chat) { create(:chat, application: application) }
  let(:valid_attributes) { attributes_for(:message) }
  let(:invalid_attributes) { attributes_for(:message, :invalid) }
  let(:message) { create(:message, chat: chat) }
  describe 'GET /index' do
    before do
      message
    end
    it 'renders a successful response' do
      get application_chat_messages_url(application.token, chat.chat_number), as: :json
      expect(response).to be_successful
      expect(parsed_response_body[:messages].count).to eq(1)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get application_chat_message_url(application.token, chat.chat_number, message.message_number), as: :json
      expect(response).to be_successful
      expect(parsed_response_body[:message][:message_number]).to eq(message.message_number)
    end
  end

  # describe 'POST /create' do
  #   context 'with valid parameters' do
  #     before do
  #       # expect_any_instance_of(Producer::Messages).to receive(:publish).and_return { message }
  #     end
  #     it 'creates a new Message' do
  #       expect do
  #         post application_chat_messages_url(application.token, chat.chat_number),
  #              params: { message: valid_attributes }, as: :json
  #       end.to change(Message, :count).by(1)
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'does not create a new Message' do
  #       expect do
  #         post applications_chats_messages_url,
  #              params: { applications_chats_message: invalid_attributes }, as: :json
  #       end.to change(Message, :count).by(0)
  #     end

  #     it 'renders a JSON response with errors for the new applications_chats_message' do
  #       post applications_chats_messages_url,
  #            params: { applications_chats_message: invalid_attributes }, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end
  # end

  # describe 'PATCH /update' do
  #   context 'with valid parameters' do
  #     let(:new_attributes) do
  #       skip('Add a hash of attributes valid for your model')
  #     end

  #     it 'updates the requested applications_chats_message' do
  #       message = Message.create! valid_attributes
  #       patch application_chat_messages_url(message),
  #             params: { applications_chats_message: new_attributes }, as: :json
  #       message.reload
  #       skip('Add assertions for updated state')
  #     end

  #     it 'renders a JSON response with the applications_chats_message' do
  #       message = Message.create! valid_attributes
  #       patch application_chat_messages_url(message),
  #             params: { applications_chats_message: new_attributes }, as: :json
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'renders a JSON response with errors for the applications_chats_message' do
  #       message = Message.create! valid_attributes
  #       patch application_chat_messages_url(message),
  #             params: { applications_chats_message: invalid_attributes }, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end
  # end

  # describe 'DELETE /destroy' do
  #   it 'destroys the requested applications_chats_message' do
  #     message = Message.create! valid_attributes
  #     expect do
  #       delete application_chat_messages_url(message), headers: valid_headers, as: :json
  #     end.to change(Message, :count).by(-1)
  #   end
  # end
end
