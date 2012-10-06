class Product < ActiveRecord::Base
  attr_accessible :name, :description, :source, :featured, :display, :deleted, :artist, :image, :referer, :contact
  mount_uploader :image, ImageUploader
end
