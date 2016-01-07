module McResponsesHelper
  def session_data(response)
    response.user_id = current_user.id
  end
end
