class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :full_name

  has_many :chatrooms
end
