class Admin < ActiveRecord::Base
  attr_accessible :credentials, :provider
  belongs_to :user
end
