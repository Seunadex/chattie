class AddAccessToChatroom < ActiveRecord::Migration[5.2]
  def change
    add_column :chatrooms, :access, :integer, default: Chatroom.accesses[:general]
  end
end
