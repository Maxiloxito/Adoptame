class Sede < ApplicationRecord
  belongs_to :organizacion
  has_many :animals
  geocoded_by :direccion
  after_validation :geocode, if: ->(obj){ obj.direccion.present? and obj.direccion_changed? }
end
