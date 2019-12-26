# == Schema Information
#
# Table name: messages
#
#  id          :bigint(8)        not null, primary key
#  chatroom_id :bigint(8)
#  user_id     :bigint(8)
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  pinned      :boolean          default(FALSE)
#  pinned_by   :string
# 

class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  delegate :username, :job_description, to: :user, prefix: true

  scope :pinned, -> { where("pinned = ?", true) }

  def timestamp
    created_at.strftime("%I:%M %p - %m/%d/%y")
  end

  def datetime
    time = created_at
    time.strftime("%b #{time.day.ordinalize}")
  end
end
