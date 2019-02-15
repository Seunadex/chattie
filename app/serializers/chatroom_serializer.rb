class ChatroomSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :purpose,
    :access,
    :topic,
    :creator,
    :is_direct

  has_many :messages


  def is_direct
    object.direct?
  end
end
