class AddRoleIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :role_id, :integer
  end

  def self.down
    add_column :users, :role_id
  end
end
