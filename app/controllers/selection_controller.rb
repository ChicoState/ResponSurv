class SelectionController < ApplicationController
  include SelectionHelper
  def new
    
  end

  def create
    @selection = Selection.new(selection_param)
    session_data(@selection)  
    if @selection.save
      render :nothing => true
    else
      flash[:notice_section_failed] = true
    end
  end

  def done
    render :js => "window.location = '#{pictures_path}'"
  end

  def start_of_question
    @selection = Selection.new(row: -1, column: -1,count: -1, selected: 1, local_time: params[:local_time])
    user_and_finder(@selection)
    if @selection.save
      render :nothing => true
    else
      flash[:notice_section_failed] = true
    end
  end

  def end_of_question
    @selection = Selection.new(row: -1, column: -1,count: -1, selected: 0, local_time: params[:local_time])
    user_and_finder(@selection)
    if @selection.save
      render :nothing => true
    else
      flash[:notice_section_failed] = true
    end
  end

  private
  def selection_param
      params.permit(:item_id, :row, :column, :local_time)
  end
end
