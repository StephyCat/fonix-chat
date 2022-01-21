class MainChannel < ApplicationCable::Channel
  def subscribed
    stream_for Channel.find(params[:entity])
  end
end
