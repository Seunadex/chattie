require 'rails_helper'

RSpec.describe ChatroomUser, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:chatroom) }
    it { is_expected.to belong_to(:user) }
  end
end
