# frozen_string_literal: true

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

  describe "#create" do
    context "with valid data" do
      it "should create a chatroom" do
        params = {
          chatroom: {
            name: "New Chatroom",
            access: Chatroom.accesses.fetch(:general),
            creator: @user.username,
            purpose: "Random stuff"
          }
        }

        expect { post :create, params: params }.to change {
          Chatroom.count
        }.by(1)
        expect(flash[:notice]).to match(/Chatroom was successfully created./)
        assert_response 302
      end
    end
    context "with invalid data" do
      it "should not create a chatroom" do
        params = {
          chatroom: {
            name: "",
            access: Chatroom.accesses.fetch(:general),
            creator: @user.username,
            purpose: "hey"
          }
        }

        post :create, params: params, format: :json
        expect(JSON.parse(response.body)["name"].first).to eq("can't be blank")
        expect(response.status).to eq(422)
      end
    end
  end

  describe "#update" do
    context "with valid data" do
      it "should update a chatroom" do
        params = {
          id: @chatroom.id,
          chatroom: {
            name: "New Chatroom"
          }
        }
        put :update, params: params
        expect(flash[:notice]).to match(/Chatroom was successfully updated./)
        assert_redirected_to chatroom_path(@chatroom)
        assert_response 302
      end
    end
    context "with invalid data" do
      it "should not update a chatroom" do
        params = {
          id: @chatroom,
          chatroom: {
            name: ""
          }
        }

        put :update, params: params, format: :json
        expect(JSON.parse(response.body)["name"].first).to eq("can't be blank")
        expect(response.status).to eq(422)
      end
    end
  end

  describe "#destroy" do
    it "should delete a chatroom" do
      delete :destroy, params: { id: @chatroom.id }
      expect(flash[:notice]).to match(/Chatroom was successfully deleted./)
    end
  end

  describe "#update_purpose" do
    it "should update chatroom purpose" do
      put :update_purpose, params: { id: @chatroom, purpose: "New Purpose" }
      expect(flash[:notice]).to match(/Purpose has been set./)
      assert_redirected_to chatroom_path(@chatroom)
    end
  end

  describe "#update_topic" do
    it "should update chatroom purpose" do
      put :update_topic, params: { id: @chatroom, topic: "New topic" }
      expect(flash[:notice]).to match(/Topic has been set./)
      assert_redirected_to chatroom_path(@chatroom)
    end
  end
end
