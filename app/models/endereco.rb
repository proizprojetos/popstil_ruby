class Endereco < ActiveRecord::Base
  belongs_to :user
  
  validates :cep, :endereco, :numero, :bairro, :cidade, :estado, presence: true
  
end
