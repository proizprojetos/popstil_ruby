class RenomearColumanNomeCompleto < ActiveRecord::Migration
  def change
    rename_column :users, :nome_completo, :nome
    add_column :users, :sobrenome, :string
  end
  
end
