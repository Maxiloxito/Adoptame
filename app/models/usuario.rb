class Usuario < ApplicationRecord
    has_secure_password

    has_many :adopciones
    validates :correo, uniqueness: true
end