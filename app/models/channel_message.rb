class ChannelMessage < ApplicationRecord
  belongs_to :user
  belongs_to :channel, inverse_of: :messages
end
