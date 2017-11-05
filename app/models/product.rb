class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :cart_items
  belongs_to :cart
end
