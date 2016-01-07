class OrdersController < ApplicationController
  def index
    @finders = Finder.all
    @questions = McQuestion.all
  end

  def new
    @question = finder_or_mc_question
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    set_foreign_id(@order)
    if @order.save
      flash[:sucess] = "Added Order"
      redirect_to(:back)
    else
      flash[:error] = "error"
      redirect_to(:back)
    end
  end

  def edit
    @order = Order.find(params[:id])
    @finders = Finder.all
    @questions = McQuestion.all
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:sucess] = "Added Order"
      redirect_to(:back)
    else
      flash[:error] = "error"
      redirect_to(:back)
    end
  end

  private
  def order_params
    params.require(:order).permit(:orderable, :mc_question_id, :finder_id)
  end

  def finder_or_mc_question
    if params[:finder_id]
      Finder.find(params[:finder_id])
    else
      McQuestion.find(params[:mc_question_id])
    end
  end

  def set_foreign_id(order)
    if params[:finder_id]
      order.finder = Finder.find(params[:finder_id])
    else
      order.mc_question = McQuestion.find(params[:mc_question_id])
    end
    return order
  end
end
