class User < ActiveRecord::Base
  has_many :endereco, dependent: :destroy, :order => 'principal DESC'
  
  validates :nome, :sexo, :sobrenome, presence: true
  validates :cpf, :email, :username, presence: true, uniqueness: true
  has_secure_password
  
  accepts_nested_attributes_for :endereco, allow_destroy: true
  
  def get_endereco
    self.endereco.map! do |endereco|
      Endereco.find_or_create_by_id(endereco.id)
    end
  end
  
  def to_s
    "Id: #{id}, Nome: #{nome}, Username: #{username}"
  end    
end
