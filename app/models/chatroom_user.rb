# == Schema Information
#
# Table name: chatroom_users
#
#  id           :bigint(8)        not null, primary key
#  chatroom_id  :bigint(8)
#  user_id      :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  last_read_at :datetime
#  starred      :boolean          default(FALSE)
#

class ChatroomUser < ApplicationRecord
  belongs_to :chatroom, touch: true
  belongs_to :user, touch: true

  before_create :set_last_read

  delegate :username, :qoute, :job_description, :fullname,  :to => :user, :prefix => true

  def set_last_read
    self.last_read_at = Time.zone.now
  end
end
