class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nome_completo
      t.integer :cpf
      t.date :data_nascimento
      t.string :sexo, :limit => 1
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :receber_newsletter, :limit => 1

      t.timestamps
    end
  end
end
