class ChannelMessagesController < ApplicationController

  before_action :load_entities

  def create
    @channel_message = ChannelMessage.create!({
      user: current_user,
      channel: @channel,
      message: params.dig(:channel_message, :message),
    })
  end

  protected

  def load_entities
    @channel = Channel.find params.dig(:channel_message, :channel_id)
  end

end
