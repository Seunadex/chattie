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
  validates :name, :access, :creator, presence: true

  scope :public_channels, -> { where(direct_message: false) }
  scope :direct_messages, -> { where(direct_message: true) }

  enum access: {
    general: 0,
    secure: 1
  }

  def self.direct_message_for_users(users)
    user_name = users.pluck(:username).to_sentence

    if chatroom = direct_messages.find_by(name: user_name)
      chatroom
    else
      chatroom = new(name: user_name, direct_message: true)
      chatroom.users = users
      chatroom.creator = users.last.username
      chatroom.save
      chatroom
    end
  end

  def public?
    general?
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

  def members
    ChatroomUser.includes(:user).where("chatroom_id = ?", self.id)
  end
end
