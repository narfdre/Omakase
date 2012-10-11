class Setting < ActiveRecord::Base
  attr_accessible :app_name, :product_type, :description
end
