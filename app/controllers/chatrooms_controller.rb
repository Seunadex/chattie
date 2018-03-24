class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i(show edit update destroy)
  before_action :get_all_users

  def index
    @chatrooms = Chatroom.public_channels
  end

  def show
    @messages = @chatroom.messages.order(created_at: :desc).limit(200).reverse
    @chatroom_user = current_user.chatroom_users.find_by(
      chatroom_id: @chatroom.id
    )
    @chatroom_purpose = Chatroom.get_chatroom_purpose(set_chatroom)

    # @chatroom_info = {
    #   messages: messages,
    #   chatroom_user: chatroom_user,
    #   purpose: chatroom_purpose
    # }
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
    @chatroom = Chatroom.find(params[:id])
    @chatroom.update_attribute(:purpose, params[:purpose])
    redirect_to chatroom_path, notice: "Topic has been set."
  end

  private

  def join_room(chatroom)
    chatroom.chatroom_users.where(
      user_id: current_user.id
    ).first_or_create
  end

  def get_all_users
    @users = User.get_users
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_chatroom
    @chatroom = Chatroom.get_chatroom(params[:id])
  end

  def purpose_params
    params.require(:chatroom).permit(:purpose)
  end

  def chatroom_params
    params.require(:chatroom).permit(:name, :access, :creator)
  end
end
