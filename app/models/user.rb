class User < ActiveRecord::Base
  validates :username, presence: true
  validates_uniqueness_of :username
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}

  before_save :default_values

  def default_values
    self.current_question = 0 if self.current_question.nil?
  end


  def update_current_question
    self.update(:current_question => self.current_question+1)
    self.save(:validate => false) #need a better solution end
  end
end
