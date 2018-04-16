module MessagesHelper
  def check_last_message
    @messages.last.user = current_user
  end

  def markdown(message)
    Kramdown::Document.new(message, input: "GFM").to_html
  end

  def persist_pin(message, status)
    if status == "pin"
      if message.pinned then fa_icon "map-pin red" else fa_icon "map-pin" end
    else
      message.pinned ? "show-pinned" : ""
    end
  end
end
