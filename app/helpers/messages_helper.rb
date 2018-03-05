module MessagesHelper
  def check_last_message
    @messages.last.user = current_user
  end
end
