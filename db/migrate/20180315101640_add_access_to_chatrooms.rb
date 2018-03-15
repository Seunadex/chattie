class AddAccessToChatrooms < ActiveRecord::Migration[5.1]
  def change
    add_column :chatrooms, :access, :string, default: 'public'
  end
end
