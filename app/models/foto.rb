class Foto < ApplicationRecord
  belongs_to :animal
  mount_uploader :imagen, ImageUploader
  mount_uploader :imagen2, ImageUploader
  mount_uploader :imagen3, ImageUploader
end