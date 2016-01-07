class McChoice < ActiveRecord::Base
  has_and_belongs_to_many :mc_questions
end
