# frozen_string_literal: true

Rabbitmq.initialize_connection_pool
Consumer::Messages.new.subscribe
