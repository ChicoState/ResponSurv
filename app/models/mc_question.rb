class McQuestion < ActiveRecord::Base
  has_and_belongs_to_many :mc_choices
  has_one :order, :inverse_of => :mc_question

  def item
    Item.find_by(id: item_id)
  end
  
  def question
    :prompt
  end
end
