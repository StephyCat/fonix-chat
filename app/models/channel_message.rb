class ChannelMessage < ApplicationRecord
  belongs_to :user
  belongs_to :channel, inverse_of: :messages

  def as_json(options)
    super(options).merge({
      updated_at: user.updated_at.strftime('%F %T %:z'),
      user_avatar_url: user.avatar_url,
      user_full_name: user.full_name,
    })
  end
end
