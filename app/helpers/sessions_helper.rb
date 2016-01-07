module SessionsHelper
  #User session data
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  #Order session data
  def render_question
    order = Order.find_by(orderable: current_user.current_question)
    if order == nil
      return order
    elsif order.finder_id
      Finder.find_by(id: order.finder_id)
    else
      McQuestion.find_by(id: order.mc_question_id)
    end
  end

  
  #Question session data
  def set_cur_question(id)
    session[:question_id] = id
    set_count
  end

  def cur_question
    @cur_question ||= Finder.find_by(id: session[:question_id])
  end

  #Item session data
  def set_render_items(true_or_false)
    session[:render_images] = true_or_false
  end

  def render_items
    session[:render_images]
  end

  def set_image_array(images)
    images.each_with_index do |image, index|
      session[index] = image.id
    end
  end

  def image_id_at_index(index)
    session[index]
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
