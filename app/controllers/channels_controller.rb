class ChannelsController < ApplicationController

  before_action :load_entities

  def index
    redirect_to channel_path(id: 1)
  end

  def show
    @channel_message = ChannelMessage.new channel: @channel
    @channel_messages = @channel.messages.includes(:user)
  end

  protected

  def load_entities
    @channels = Channel.all
    @channel = Channel.find(params[:id]) if params[:id]
  end

end
