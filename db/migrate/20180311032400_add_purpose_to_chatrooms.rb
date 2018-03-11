class AddPurposeToChatrooms < ActiveRecord::Migration[5.1]
  def change
    add_column :chatrooms, :purpose, :string
  end
end
