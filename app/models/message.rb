class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  def timestamp
    created_at.strftime("%I:%M%p")
  end
end
