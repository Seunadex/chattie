class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :qoute, :string
    add_column :users, :job_description, :string
    add_column :users, :role, :string, default: 'user'
  end
end
