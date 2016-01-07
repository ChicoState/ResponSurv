class McResponse < ActiveRecord::Base
  belongs_to :mc_question
  belongs_to :mc_choice
  belongs_to :user
end
