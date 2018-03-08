require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:chatroom_users) }
    it { is_expected.to have_many(:chatrooms).through(:chatroom_users) }
    it { is_expected.to have_many(:messages) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }
    xit { is_expected.to validate_uniqueness_of(:username) }
    xit { is_expected.to validate_uniqueness_of(:email) }
  end
end

