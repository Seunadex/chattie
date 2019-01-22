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

require "rails_helper"

RSpec.describe ChatroomUser, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:chatroom) }
    it { is_expected.to belong_to(:user) }
  end
end
