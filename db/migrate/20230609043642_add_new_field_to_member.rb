class AddNewFieldToMember < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :username, :string
    add_column :members, :password, :string
  end
end
