module SessionsHelper
  #Order session data
  def render_question
    order = Order.find_by(orderable: current_user.current_question)
    if order == nil
      return order
    else
      McQuestion.find_by(id: order.mc_question_id)
    end
  end

  #Question session data
  def set_cur_question(id)
    session[:question_id] = id
    set_count
  end

  #Count
  def set_count(value = 1)
    session[:count] = value
  end

  def increment_count
    session[:count] = (session[:count].to_i+1).to_s
  end

  def current_count
    session[:count]
  end
end
