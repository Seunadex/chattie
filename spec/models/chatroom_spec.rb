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

require "rails_helper"

RSpec.describe Chatroom, type: :model do
  describe "Associations" do
    it { is_expected.to have_many(:chatroom_users) }
    it { is_expected.to have_many(:users).through(:chatroom_users) }
    it { is_expected.to have_many(:messages) }
  end

  describe "Validations" do
    it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end
end
