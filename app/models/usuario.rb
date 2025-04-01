class Usuario < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  
  validates :nome, :sobrenome, :email, presence: true, length: { maximum: 100}
  validates :password, presence: true, length: { minimum: 6 }
end
