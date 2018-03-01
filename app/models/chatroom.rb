class Chatroom < ApplicationRecord
  has_many :chatroom_users
  has_many :users, through: :chatroom_users
  has_many :messages

  validates :name, uniqueness: { case_sensitive: false }

  def self.get_chatroom(chatroom_id)
    Chatroom.find(chatroom_id)
  end
end
