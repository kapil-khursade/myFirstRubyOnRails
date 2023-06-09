class AddRoleToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :role, :string
  end
end
