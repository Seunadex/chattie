class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :full_name

  has_many :chatroom_users
end
