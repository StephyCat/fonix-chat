class ApplicationMailer < ActionMailer::Base
  default from: 'Fonix <no-reply@fonix.com>'
  layout 'mailer'

  def weekly_statistics(user)
    @from_date = (Date.current - Date.current.wday - 7).beginning_of_day
    @to_date = @from_date.end_of_week.end_of_day

    @user = user

    @total_exchanged_last_week = ChannelMessage.where(updated_at: @from_date..@to_date).count
    @last_sent_message = ChannelMessage.where(user: user).last
    @total_since_last_message = ChannelMessage.where('id < ?', @last_sent_message.id).where.not(user: user).count rescue 0

    mail({
      to: user.email,
      subject: "[Fonix] Weekly Statistics of Chatroom",
    })
  end
end
