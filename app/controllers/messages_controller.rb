# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def create
    msg = @chatroom.messages.new(message_params)
    msg.user = current_user

    MessageRelayJob.perform_later(msg) if msg.body.present? && msg.save
  end

  def pin_message
    message = @chatroom.messages.find(params[:id])
    message.update_attributes(
      pinned: !message.pinned,
      pinned_by: message.pinned ? nil : current_user.username
    )
  end

  def show; end

  def get_pinned_messages
    @data = @chatroom.messages.includes(:user).pinned.map do |msg|
      {
        body: Kramdown::Document.new(msg.body, input: "GFM").to_html,
        username: msg.user_username,
        date: msg.datetime
      }
    end
    respond_to do |format|
      format.json { render json: @data }
    end
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
