class MessageMailer < ApplicationMailer

  def receive_notification(user)
    @user = user
    mail to: user.email, subject: "メッセージが届きました"
  end
end
