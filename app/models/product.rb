class Product < ActiveRecord::Base
  attr_accessible :name, :slug, :description, :source, :featured, :display, :deleted, :creator, :image, :referer, :contact
  mount_uploader :image, ImageUploader
  before_save :generate_slug, :scrub_source

  validates :name, :description, :source, :referer, :contact, :presence => true
  validates :image, :presence => true, :if => :new_record?
  
  def generate_slug
      self.slug = name.gsub(' ', '-')
  end

  def scrub_source
    unless self.source =~ /^(http|https):\/\//
      self.source = "http://#{self.source}"
    end
  end
end