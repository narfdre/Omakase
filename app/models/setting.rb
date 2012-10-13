class Setting < ActiveRecord::Base
  attr_accessible :app_name, :product_type, :description, :simple

  validates_presence_of :app_name, :product_type, :description
end
