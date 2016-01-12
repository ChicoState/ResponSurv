class StaticPagesController < ApplicationController
  include SelectionHelper
  include StaticPagesHelper
  def questions
    @finder = render_question
    set_cur_question(@finder.id) #SessionHelper
  end

  def pictures
    @finder = Finder.find(4)
    @images = @finder.items
    @images = @images[0..19].shuffle
    @type = :pictures
    set_image_array @images #SessionHelper
  end

  def followup
    @question = McQuestion.find(6)
    @type = :followup
    if @question.item
      @image = @question.item
    elsif @question.finder_id
      @image = Selection.where(finder_id: @question.finder_id, user_id: current_user.id, count: 1).take!.item
    else
      @image = nil
    end
    @choices = @question.mc_choices
    @response = McResponse.new
  end

  def survey
    view  #StaticPagesHelper
  end

  def next_question
    if !render_items #render_question the same for pair of question/pictures
      current_user.update_current_question
    end
    render :js => "window.location = '#{root_path}'"
  end
end
