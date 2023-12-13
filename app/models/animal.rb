class Animal < ApplicationRecord
    validates :tipo_animal, inclusion: { in: %w(perro gato conejo otro), message: "no es un tipo de animal válido" }
    validates :nombre, presence: true
    validates :tipo_animal_personalizado, presence: true, if: :tipo_animal_otro?

    has_many :fotos
    accepts_nested_attributes_for :fotos, allow_destroy: true
    has_many :adopciones
    
    private

    def tipo_animal_otro?
     tipo_animal == 'otro'
    end
end