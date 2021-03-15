class RemoveAccessFromChatroom < ActiveRecord::Migration[5.2]
  def change
    remove_column :chatrooms, :access
  end
end
