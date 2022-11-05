# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Applications::ChatsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/applications/chats').to route_to('applications/chats#index')
    end

    it 'routes to #show' do
      expect(get: '/applications/chats/1').to route_to('applications/chats#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/applications/chats').to route_to('applications/chats#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/applications/chats/1').to route_to('applications/chats#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/applications/chats/1').to route_to('applications/chats#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/applications/chats/1').to route_to('applications/chats#destroy', id: '1')
    end
  end
end
