class AddColumnsToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :pinned, :boolean, default: false
    add_column :messages, :pinned_by, :string
  end
end
