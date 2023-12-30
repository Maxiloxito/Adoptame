class Colectum < ApplicationRecord
    self.table_name = 'colectas'
    belongs_to :organizacion

end
