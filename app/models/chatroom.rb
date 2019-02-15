# == Schema Information
#
# Table name: chatrooms
#
#  id             :bigint(8)        not null, primary key
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  direct_message :boolean          default(FALSE)
#  purpose        :string           default("")
#  access         :string           default("public")
#  creator        :string
#  topic          :string
#  slug           :string
#

class Chatroom < ApplicationRecord
  has_many :chatroom_users, dependent: :destroy
  has_many :users, through: :chatroom_users
  has_many :messages, dependent: :destroy

  validates :name, uniqueness: { case_sensitive: false }
  validates :name, :access, presence: true

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


  def direct?
    direct_message
  end

  def public?
    access == "public"
  end

  def private?
    !public?
  end

  def purpose?
    !purpose.nil?
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
