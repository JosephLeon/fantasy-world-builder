module CharactersHelper

  def find_plurality_for_items(item_count)
    items = "items"
    item = "item"
    if item_count <= 1
      item
    else
      items
    end
  end

end
