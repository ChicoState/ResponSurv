class Item < ActiveRecord::Base
  has_attached_file :image, :styles => { :thumb => "200x150" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  has_and_belongs_to_many :finders
end
