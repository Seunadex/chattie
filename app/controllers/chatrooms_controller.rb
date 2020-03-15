# frozen_string_literal: true

class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_users
  before_action :set_chatroom, only: %i(
    show
    edit
    update
    destroy
    update_purpose
    update_topic
  )

  def index
    @chatrooms = Chatroom.public_channels
  end

  def show
    @messages = @chatroom.messages.
                includes(:user).
                order(created_at: :desc).
                limit(200).
                reverse
    @chatroom_user = current_user.chatroom_users.find_by(
      chatroom_id: @chatroom.id
    )
  end

  def new
    @chatroom = Chatroom.new
  end

  def edit; end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    respond_to do |format|
      if @chatroom.save
        join_room(@chatroom)
        format.html do
          redirect_to @chatroom, notice: "Chatroom was successfully created."
        end
        format.json { render :show, status: :created, location: @chatroom }
      else
        format.html { render :new }
        format.json do
          render json: @chatroom.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @chatroom.update(chatroom_params)
        format.html do
          redirect_to @chatroom, notice: "Chatroom was successfully updated."
        end
        format.json { render :show, status: :ok, location: @chatroom }
      else
        format.html { render :edit }
        format.json do
          render json: @chatroom.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @chatroom.destroy
    respond_to do |format|
      format.html do
        redirect_to chatrooms_url, notice: "Chatroom was successfully deleted."
      end
      format.json { head :no_content }
    end
  end

  def update_purpose
    @chatroom.update_attribute(:purpose, params[:purpose])
    redirect_to chatroom_path, notice: "Purpose has been set."
  end

  def update_topic
    @chatroom.update_attribute(:topic, params[:topic])
    redirect_to chatroom_path, notice: "Topic has been set."
  end

  private

  def join_room(chatroom)
    chatroom.chatroom_users.where(
      user_id: current_user.id
    ).first_or_create
  end

  def set_chatroom
    # binding.pry
    @chatroom = Chatroom.find(params[:id])
  end

  def chatroom_params
    fields = params.require(:chatroom).permit(
      :name,
      :access,
      :creator,
      :purpose
    )
    fields[:access] = fields[:access].to_i
    fields
  end

  def set_users
    @users = User.all
  end
end
