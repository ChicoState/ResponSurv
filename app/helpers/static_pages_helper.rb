module StaticPagesHelper
  def view                #logged in? if not login
    if !logged_in?
      render 'sessions/new'
    else
      next_view           #if so, start survey
    end
  end

  def next_view
    if current_user.current_question == 0   #0 order render welcome
      set_render_items false
      @type = 'welcome'
      render template: 'static_pages/welcome'
    else                    #>0 order render finder or mc_question
      @next = render_question
      if @next == nil
        render template: 'static_pages/thankyou'
      elsif @next.class == Finder
        if render_items #render_question the same for pair of question/pictures
          set_render_items false
          render_pictures
        else
          set_render_items true
          render_finder
        end
      elsif @next.class == McQuestion
        render_followup
      end
    end
  end

  def render_finder
    @finder = @next
    set_cur_question(@finder.id)
    @type = :finder
    render 'static_pages/questions'
  end

  def render_pictures
    @finder = @next
    @images = cur_question.items
    set_image_array @images #SessionHelper
    @type = :pictures
    render 'static_pages/pictures'
  end

  def render_followup
    @question = @next
    if @question.item
      @image = @question.item
    elsif @question.finder_id
      @image = Selection.where(finder_id: @question.finder_id, user_id: current_user.id, count: 1).take!.item
    else
      @image = nil
    end
    @choices = @question.mc_choices
    @response = McResponse.new
    @type = :followup
    render 'static_pages/followup'
  end
end
