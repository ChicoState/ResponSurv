class Finder < ActiveRecord::Base
  has_one :order, :inverse_of => :finder
  has_and_belongs_to_many :items
end
