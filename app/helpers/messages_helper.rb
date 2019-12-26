module MessagesHelper
  def markdown(message)
    Kramdown::Document.new(message, input: "GFM").to_html
  end

  def persist_pin(message)
    if message.pinned then fa_icon "map-pin red" else fa_icon "map-pin" end
  end
end
