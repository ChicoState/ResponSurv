class McChoicesController < ApplicationController
  def new
    @choice = McChoice.new
  end

  def create
    @choice = McChoice.new(choice_params)

    if @choice.save
      flash[:sucess] = "Added MC Choice"
      redirect_to root_url
    else
      flash[:error] = "error"
      redirect_to root_url
    end
  end

  def destroy
  end

  private
    
    def choice_params
      params.require(:mc_choice).permit(:choice)
    end
end
