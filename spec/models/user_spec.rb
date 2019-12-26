# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  username               :string
#  qoute                  :string
#  job_description        :string
#  role                   :string           default("user")
#

require "rails_helper"

RSpec.describe User, type: :model do
  describe "Associations" do
    it { is_expected.to have_many(:chatroom_users) }
    it { is_expected.to have_many(:chatrooms).through(:chatroom_users) }
    it { is_expected.to have_many(:messages) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }
    it {
      is_expected.to validate_uniqueness_of(:username).ignoring_case_sensitivity
    }
    it {
      is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity
    }
  end
end
