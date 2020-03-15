# frozen_string_literal: true

require "rails_helper"

RSpec.describe RegistrationsController, type: :controller do
  describe "#new" do
    it "accepts routing for :new" do
      expect(get: "/users/sign_up").to be_routable
    end
  end

  describe "#create" do
    before :each do
      request.env["devise.mapping"] = Devise.mappings[:user]
    end
    it "should create a new user" do
      params = {
        user: {
          first_name: "Seun",
          last_name: "Adekunle",
          username: "Seunadex",
          email: "seunadex@gmail.com",
          password: "new password"
        }
      }

      post :create, params: params
      expect(flash[:notice]).to match(
        /Welcome! You have signed up successfully./
      )
      assert_redirected_to root_path
    end
  end
end
