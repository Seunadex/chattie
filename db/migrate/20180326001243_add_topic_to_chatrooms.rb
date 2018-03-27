class AddTopicToChatrooms < ActiveRecord::Migration[5.1]
  def change
    add_column :chatrooms, :topic, :string
  end
end
