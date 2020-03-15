# frozen_string_literal: true

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

require "test_helper"

class ChatroomUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
