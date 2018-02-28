class Chatroom < ApplicationRecord
  has_many :chatroom
  has_many :users, through: :chatroom_users
  has_many :messages
end
