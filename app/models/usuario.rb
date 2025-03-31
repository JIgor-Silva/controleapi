class Usuario < ApplicationRecord
  has_secure_password

  validates :nome, presence: true, length: { maximum: 100 }
  validates :sobrenome, presence: true, length: { maximum: 100 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :senha, presence: true, length: { minimum: 6 }
end
