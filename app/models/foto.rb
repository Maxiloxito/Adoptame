class Foto < ApplicationRecord
  belongs_to :animal
  mount_uploader :imagen, ImageUploader
  
end