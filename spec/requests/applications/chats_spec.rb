# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Applications::ChatsController, type: :request do
  let(:valid_attributes) { attributes_for(:chat) }
  let(:invalid_attributes) { attributes_for(:chat, :invalid) }
  let(:application) { create(:application) }
  let(:chat) { create(:chat, application: application) }
  let(:invalid_token) { '123' }

  describe 'GET /index' do
    before do
      chat
    end
    it 'renders a successful response' do
      get application_chats_url(application.token), as: :json
      expect(response).to be_successful
      expect(parsed_response_body[:chats].count).to eq(1)
    end
  end

  describe 'GET /show' do
    before do
      chat
    end
    it 'renders a successful response' do
      get application_chat_url(application.token, chat.chat_number), as: :json
      expect(response).to be_successful
      expect(parsed_response_body[:chat][:chat_number]).to eq(chat.chat_number)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new chat' do
        expect do
          post application_chats_url(application.token),
               params: { chat: valid_attributes }, as: :json
        end.to change(Chat, :count).by(1)
      end
    end

    context 'with pass invalid application token' do
      it 'returns not found status' do
        post application_chats_url(invalid_token), params: { chat: invalid_attributes }, as: :json
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  # describe 'PATCH /update' do
  #   context 'with valid parameters' do
  #     it 'updates the requested applications_chat' do
  #       patch application_chat_url(chat),
  #             params: { chat:  }, as: :json
  #       chat.reload
  #       skip('Add assertions for updated state')
  #     end

  #     it 'renders a JSON response with the applications_chat' do
  #       cha
  #       patch application_chat_url(chat),
  #             params: { applications_chat: new_attributes }, as: :json
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'renders a JSON response with errors for the applications_chat' do
  #       cha
  #       patch application_chat_url(chat),
  #             params: { applications_chat: invalid_attributes }, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end
  # end

  # describe 'DELETE /destroy' do
  #   it 'destroys the requested applications_chat' do
  #     expect do
  #       delete application_chat_url(chat), as: :json
  #     end.to change(Applications::Chat, :count).by(-1)
  #   end
  # end
end
