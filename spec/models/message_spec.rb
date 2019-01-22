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

require "rails_helper"

RSpec.describe Message, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:chatroom) }
    it { is_expected.to belong_to(:user) }
  end
end
