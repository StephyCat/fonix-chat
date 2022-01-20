class Channel < ApplicationRecord
  has_many :messages, class_name: 'ChannelMessage', dependent: :destroy, inverse_of: :channel
end
