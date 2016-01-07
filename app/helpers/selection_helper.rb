module SelectionHelper
  def session_data(selection)
    user_and_finder(selection)
    index = index_of_selection(selection)
    selection.item_id = image_id_at_index(index)
    selection.count = current_count
    increment_count
    if selection.previous_selected?
      selection.selected = false
    else
      selection.selected = true
    end
    return selection
  end

  def user_and_finder(selection)
    selection.user_id = current_user.id
    selection.finder_id = cur_question.id
  end

  def index_of_selection(selection)
    (selection.row-1)*5+(selection.column-1)
  end
end
