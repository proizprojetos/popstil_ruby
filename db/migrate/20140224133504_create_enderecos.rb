class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.integer :cep
      t.string :endereco
      t.integer :numero
      t.string :complemento
      t.string :tipo_endereco, :limit => 1
      t.string :bairro
      t.string :cidade
      t.string :estado

      t.timestamps
    end
  end
end
