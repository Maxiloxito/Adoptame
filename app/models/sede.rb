class Sede < ApplicationRecord
  belongs_to :organizacion
  has_many :animals

end
