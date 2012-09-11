class Product < ActiveRecord::Base
  attr_accessible :artist, :description, :display, :featured, :merchant, :name, :source, :image
  has_one :user
  mount_uploader :image, ImageUploader
end
