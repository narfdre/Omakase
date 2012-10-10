class Product < ActiveRecord::Base
  attr_accessible :name, :slug, :description, :source, :featured, :display, :deleted, :artist, :image, :referer, :contact
  mount_uploader :image, ImageUploader
  before_save :generate_slug

  validates :name, :description, :source, :artist, :image, :referer, :contact, :presence => true

  def generate_slug
      self.slug = name.gsub(' ', '-')
  end
end