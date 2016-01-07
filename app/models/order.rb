class Order < ActiveRecord::Base
  #belongs_to :question, :polymorphic => true
  belongs_to :finder, :inverse_of => :order
  belongs_to :mc_question, :inverse_of => :order

  validates_uniqueness_of :orderable

  def last_order
    Order.order(orderable: :desc).select("orderable").first.orderable
  end
end
