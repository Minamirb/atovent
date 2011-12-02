class Page < ActiveRecord::Base
  belongs_to :workshop
  self.inheritance_column = "page_type"
end
