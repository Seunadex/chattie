require "rails_helper"

RSpec.describe ChatroomsController, type: :controller do
  before do
    @user = setup_user_and_log_in(request)
    @chatroom = FactoryBot.create(:chatroom, creator: @user.username)
  end

  describe "#index" do
    it "should visit index" do
      get :index
      assert_response :success
    end
  end

  describe "#new" do
    it "should get new" do
      get :new
      assert_response :success
      expect(response).to render_template("new")
    end
  end

  describe "#show" do
    it "should visit chatroom" do
      get :show, params: { id: @chatroom.id }
      assert_response :success
    end
  end
end
