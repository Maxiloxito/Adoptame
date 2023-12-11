class Animal < ApplicationRecord
    has_many :fotos
    accepts_nested_attributes_for :fotos, allow_destroy: true
    has_many :adopciones
end