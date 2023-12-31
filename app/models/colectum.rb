class Colectum < ApplicationRecord
    self.table_name = 'colectas'
    belongs_to :organizacion
    validates :meta, numericality: { greater_than_or_equal_to: 0 }
    validates :fondos_recaudados, numericality: { greater_than_or_equal_to: 0 }

end
