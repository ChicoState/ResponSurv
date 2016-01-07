class FindersController < ApplicationController
  def index
    @finders = Finder.all
  end

  def new
    @finder = Finder.new
    @items = Item.all
    @finder.noneEnabled = true
    @finder.multipleChoice = true
    @finder.timed = true
  end

  def create
    @finder = Finder.new(finder_params)

    if @finder.save
    else
    end
  end

  def show
    @finder = Finder.find(params[:id])
  end

  def edit
    @finder = Finder.find(params[:id])
    @items = Item.all
  end

  def update
    @finder = Finder.find(params[:id])
    if @finder.update(finder_params)
      redirect_to(:back)
    else
      redirect_to(:back)
    end
  end

  private

    def finder_params
      params.require(:finder).permit(:question, :noneEnabled, :multipleChoice, :timed, :item_ids=>[])
    end
end

