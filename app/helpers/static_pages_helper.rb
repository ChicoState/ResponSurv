module StaticPagesHelper
  def view
    next_view
  end

  def next_view
    if current_user.current_question == 0 # 0 order render welcome
      @question = Question.new
      render template: 'static_pages/welcome'
    else # >0 order render finder or mc_question
      @next = render_question
      if @next.nil?
        render template: 'static_pages/thankyou'
      elsif @next.class == Finder
        if render_items # render_question the same for pair of question/pictures
          set_render_items false
          render_pictures
        else
          set_render_items true
        end
      elsif @next.class == McQuestion
        render_followup
      end
    end
  end
end
