class ChatroomUser < ApplicationRecord
  belongs_to :chatroom, touch: true
  belongs_to :user, touch: true

  before_create :set_last_read

  def set_last_read
    self.last_read_at = Time.zone.now
  end

  def self.member?(chatroom_id)
    joins(:chatroom, :user).where("chatroom_id = ?", chatroom_id)
  end

  def self.has_joined?(chatroom_id, user_id)
    joins(:chatroom, :user).where(
      [
        "chatroom_id = ? and user_id = ?",
        chatroom_id, user_id
      ]
    )
  end
end
