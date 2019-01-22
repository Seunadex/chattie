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

require "test_helper"

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
