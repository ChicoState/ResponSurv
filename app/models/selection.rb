class Selection < ActiveRecord::Base
  belongs_to :items
  belongs_to :finders
  belongs_to :users

  def previous_selected?
    if select = Selection.where(item_id: self.item_id, user_id: self.user_id, finder_id: self.finder_id).last
      select.selected
    else
      false
    end
  end

  def item
    Item.find_by id: self.item_id
  end
end
