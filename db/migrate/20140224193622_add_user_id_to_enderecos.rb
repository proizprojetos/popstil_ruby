class AddUserIdToEnderecos < ActiveRecord::Migration
  def change
    add_column :enderecos, :user_id, :integer
  end
end
