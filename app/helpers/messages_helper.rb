module MessagesHelper
  def check_last_message
    @messages.last.user = current_user
  end

  def markdown_to_html(text)
    Kramdown::Document.new(text, input: 'GFM').to_html
  end
end
