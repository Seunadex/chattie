class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i(show edit update destroy)
  before_action :get_all_users

  # GET /chatrooms
  # GET /chatrooms.json
  def index
    @chatrooms = Chatroom.public_channels
  end

  # GET /chatrooms/1
  # GET /chatrooms/1.json
  def show
    @messages = @chatroom.messages.order(created_at: :desc).limit(100).reverse
    @chatroom_user = current_user.chatroom_users.find_by(
      chatroom_id: @chatroom.id
    )
  end

  # GET /chatrooms/new
  def new
    @chatroom = Chatroom.new
  end

  # GET /chatrooms/1/edit
  def edit; end

  # POST /chatrooms
  # POST /chatrooms.json
  def create
    @chatroom = Chatroom.new(chatroom_params)

    respond_to do |format|
      if @chatroom.save
        format.html do
          redirect_to @chatroom,
                      notice: "Chatroom was successfully created."
        end
        format.json { render :show, status: :created, location: @chatroom }
      else
        format.html { render :new }
        format.json do
          render json: @chatroom.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /chatrooms/1
  # PATCH/PUT /chatrooms/1.json
  def update
    respond_to do |format|
      if @chatroom.update(chatroom_params)
        format.html do
          redirect_to @chatroom,
                      notice: "Chatroom was successfully updated."
        end
        format.json { render :show, status: :ok, location: @chatroom }
      else
        format.html { render :edit }
        format.json do
          render json: @chatroom.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /chatrooms/1
  # DELETE /chatrooms/1.json
  def destroy
    @chatroom.destroy
    respond_to do |format|
      format.html do
        redirect_to chatrooms_url,
                    notice: "Chatroom was successfully deleted."
      end
      format.json { head :no_content }
    end
  end

  private

  def get_all_users
    @users = User.get_users
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_chatroom
    @chatroom = Chatroom.get_chatroom(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
