class McResponsesController < ApplicationController
  include McResponsesHelper

  def new
  end

  def create
    @response = McResponse.new(response_param)
    session_data(@response)
    if @response.save
      current_user.update_current_question
      redirect_to root_url
    else
      flash[:failed] = true
    end
  end

  def destroy
  end
  
  private
  def response_param
    params.require(:mc_response).permit(:mc_choice_id, :mc_question_id)
  end
end
