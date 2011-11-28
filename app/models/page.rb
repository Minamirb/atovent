class Page < ActiveRecord::Base
  self.inheritance_column = "page_type"
end
