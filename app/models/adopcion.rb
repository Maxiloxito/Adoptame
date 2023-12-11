class Adopcion < ApplicationRecord
  belongs_to :usuario
  belongs_to :animal
end
