class AddIdUserToEnderecos < ActiveRecord::Migration
  def change
    add_column :enderecos, :id_user, :integer
  end
end
