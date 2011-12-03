class Tagging < ActiveRecord::Base
  belongs_to :workshop
  belongs_to :tag
end
