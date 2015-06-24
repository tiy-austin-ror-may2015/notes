class Location < ActiveRecord::Base
  belongs_to :company
  has_many :employees
  has_many :courses
end
