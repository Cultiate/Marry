module UsersHelper
  def receice_notification
    MessageMailer.receive_notification(self).deliver_now
  end
end
