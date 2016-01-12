class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :environment

  def update_current_question
    update(current_question: current_question + 1)
    save(validate: false) # need a better solution end
  end
end
