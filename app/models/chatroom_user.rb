class ChatroomUser < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  before_create :set_last_read

  def set_last_read
    self.last_read_at = Time.zone.now
  end

  def self.get_chatroom_users(chatroom_id)
    joins(:chatroom, :user).where("chatroom_id = ?", chatroom_id)
  end
end
