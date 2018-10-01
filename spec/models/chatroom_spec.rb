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
