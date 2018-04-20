class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  def timestamp
    created_at.strftime("%I:%M%p")
  end

  def datetime
    time = created_at
    time.strftime("%b #{time.day.ordinalize}")
  end

  def self.pinned?(chatroom_id)
    where(["pinned = ? and chatroom_id = ?", true, chatroom_id]).
      order(created_at: :asc)
  end
end
