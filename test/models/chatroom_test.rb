# == Schema Information
#
# Table name: chatrooms
#
#  id             :bigint(8)        not null, primary key
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  direct_message :boolean          default(FALSE)
#  purpose        :string           default("")
#  access         :string           default("public")
#  creator        :string
#  topic          :string
#  slug           :string
#

require "test_helper"

class ChatroomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
