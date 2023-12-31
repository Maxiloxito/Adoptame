class Organizacion < ApplicationRecord
    has_many :animals, foreign_key: 'id_organizacion'
    has_many :sedes
    has_one_attached :logo

    has_secure_password
    has_many :adopciones, through: :animales
    validates :correo, uniqueness: true
    has_many :colectas, class_name: 'Colectum'

end