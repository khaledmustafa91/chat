# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Applications::Chats::MessagesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/applications/chats/messages').to route_to('applications/chats/messages#index')
    end

    it 'routes to #show' do
      expect(get: '/applications/chats/messages/1').to route_to('applications/chats/messages#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/applications/chats/messages').to route_to('applications/chats/messages#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/applications/chats/messages/1').to route_to('applications/chats/messages#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/applications/chats/messages/1').to route_to('applications/chats/messages#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/applications/chats/messages/1').to route_to('applications/chats/messages#destroy', id: '1')
    end
  end
end
