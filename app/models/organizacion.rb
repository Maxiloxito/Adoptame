class Organizacion < ApplicationRecord
    has_secure_password
    has_many :animales
    has_many :adopciones, through: :animales
    validates :correo, uniqueness: true
    has_many :colectas, class_name: 'Colectum'

end