class Product < ActiveRecord::Base
  attr_accessible :artist, :description, :display, :featured, :image, :merchant, :name, :source
  has_one :user
end
