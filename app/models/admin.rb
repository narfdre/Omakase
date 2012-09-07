class Admin < ActiveRecord::Base
  attr_accessible :belongs_to, :credentials, :provider
end
