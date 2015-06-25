class ScreencastOrder < ActiveRecord::Base
  belongs_to :screencast
  belongs_to :order
end
