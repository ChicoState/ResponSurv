class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new()
  end

  def create
    params[:item][:image].each do |image|
      @params = {}
      @params['image'] = image
      
      @item = Item.new(@params)
      if @item.save
        flash[:success] = "Added image"
      else
        flash[:error] = "error"
      end
    end
=begin
    @item = Item.new(item_params)

    if @item.save
      flash[:success] = "Added image"
      redirect_to(:back)
    else
      flash[:error] = "error"
      redirect_to(:back)
    end
=end
  end


  private
    
    def item_params
      params.require(:item).permit(image: [])
    end
end
