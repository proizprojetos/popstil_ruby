class AddPrincipalToEnderecos < ActiveRecord::Migration
  def change
    add_column :enderecos, :principal, :string, :limit => 1
  end
end
