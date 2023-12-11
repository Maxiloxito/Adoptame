class Usuario < ApplicationRecord
    has_secure_password

    validates :correo, uniqueness: true
end