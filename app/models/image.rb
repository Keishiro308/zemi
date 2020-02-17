class Image < ApplicationRecord
  belongs_to :event
  mount_uploader :name, ImageUploader
end
