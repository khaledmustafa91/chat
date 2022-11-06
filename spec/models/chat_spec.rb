# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Chat, type: :model do
  let(:chat) { build_stubbed(:chat) }
  let(:invalid_chat) { build_stubbed(:chat, application: nil) }

  context 'with valid attributes' do
    it 'returns success' do
      expect(chat).to be_valid
    end
  end
  
  context 'with invalid attributes' do
    it 'returns success' do
      expect(invalid_chat).to be_invalid
    end
  end

  describe '#validations' do
    context 'without application' do
      it 'fails and return errors' do
        chat.application = nil
        expect(chat).to be_invalid
        expect(chat.errors.messages[:application]).to be_present
      end
    end

    # context 'when chat number duplicate on same application' do
    #   let(:application) { build_stubbed(:application) }
    #   let(:chat_two) { create(:chat, application: application, chat_number: 1) }
    #   let(:duplicate_chat) { create(:chat, application: application, chat_number: 1) }
    #   before do
    #     chat_two
    #     duplicate_chat
    #   end
    #   it 'fails and return uniqueness error' do
    #     expect(chat_two).to be_invalid
    #     expect(chat_two.errors.messages[:chat_number]).to be_present
    #   end
    # end
  end
end
