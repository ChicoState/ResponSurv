class Question < ActiveRecord::Base
  belongs_to :user
  has_one :response
  before_create :init

  def init
    last_sequence_id = Question.maximum(:sequence_id)
    self.sequence_id = last_sequence_id.to_i + 1
  end
end
