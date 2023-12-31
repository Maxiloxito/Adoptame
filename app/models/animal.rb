class Animal < ApplicationRecord
    belongs_to :organizacion, foreign_key: 'id_organizacion'
    validates :vacunas, presence: true
    belongs_to :sede

    validates :tipo_animal, inclusion: { in: ['Perro', 'Gato', 'Conejo', 'Hámster', 'Pájaro', 'Pez', 'Tortuga', 'Cobaya', 'Iguana', 'Serpiente', 'otro'], message: "no es un tipo de animal válido" }
    validates :nombre, presence: true
    validates :tipo_animal_personalizado, presence: true, if: :tipo_animal_otro?
    validates :edad_age, numericality: { greater_than_or_equal_to: 0, only_integer: true }
    validates :edad_month, numericality: { greater_than_or_equal_to: 0, only_integer: true }
    validates :esterilizado, presence: true

    has_many :fotos
    accepts_nested_attributes_for :fotos, allow_destroy: true
    has_many :adopcions
    
    private

    def tipo_animal_otro?
     tipo_animal == 'otro'
    end
end