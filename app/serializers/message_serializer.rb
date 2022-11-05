class MessageSerializer < ActiveModel::Serializer
  attributes :body, :message_number
end
