class AddCreatorToChatroom < ActiveRecord::Migration[5.1]
  def change
    add_column :chatrooms, :creator, :string
  end
end
