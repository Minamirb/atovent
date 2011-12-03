class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :workshops, :through => :taggings
end
