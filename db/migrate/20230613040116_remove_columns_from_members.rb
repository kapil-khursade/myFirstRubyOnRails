class RemoveColumnsFromMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :members, :username, :string
    remove_column :members, :password_digest, :string
    remove_column :members, :role, :string
  end
end
