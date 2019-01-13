class Chatroom < ApplicationRecord
  has_many :chatroom_users, dependent: :destroy
  has_many :users, through: :chatroom_users
  has_many :messages, dependent: :destroy

  validates :name, uniqueness: { case_sensitive: false }

  scope :public_channels, -> { where(direct_message: false) }
  scope :direct_messages, -> { where(direct_message: true) }

  def self.get_chatroom(chatroom_id)
    find(chatroom_id)
  end

  def self.direct_message_for_users(users)
    user_name = users.map(&:username).sort
    name = user_name.join(" and ").to_s

    if chatroom = direct_messages.where(name: name).first
      chatroom
    else
      chatroom = new(name: name, direct_message: true)
      chatroom.users = users
      chatroom.save
      chatroom
    end
  end

  def self.join_chatroom(set_chatroom, current_user_id)
    set_chatroom.chatroom_users.where(
      user_id: current_user_id
    ).first_or_create
  end

  def self.get_chatroom_purpose(set_chatroom)
    set_chatroom.purpose
  end

  def self.get_topic(set_chatroom)
    set_chatroom.topic
  end

  def public?
    access == 'public'
  end

  def private?
    !public?
  end


  def timestamp_1
    created_at.strftime("%B %d, %Y")
  end

  def timestamp_2
    created_at.strftime("%I:%M%p")
  end

  def self.check_dm(id)
    find(id).direct_message
  end
end
