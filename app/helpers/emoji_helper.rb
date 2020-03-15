# frozen_string_literal: true

module EmojiHelper
  def emojify(content)
    if content.present?
      h(content).to_str.gsub(/:([\w+-]+):/) do |match|
        emoji = Emoji.find_by_alias($1)
        if emoji
          %(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}")}"
          style="vertical-align:middle" width="20" height="20" />)
        else
          match
        end
      end.html_safe
    end
  end
end
