class Product < ActiveRecord::Base
  attr_accessible :artist, :description, :display, :featured, :merchant, :name, :source, :image, :referer, :contact
  mount_uploader :image, ImageUploader
end
