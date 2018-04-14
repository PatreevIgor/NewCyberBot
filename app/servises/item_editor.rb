# frozen_string_literal: true

class ItemEditor
  def create_item(item_hash)
    Item.create(class_id:    item_hash[:class_id],
                instance_id: item_hash[:instance_id],
                hash_name:   item_hash[:hash_name],
                price:       item_hash[:current_price],
                link:        link_generator.generate_link(item_hash),
                status:      Constant::NEW_ITEMS_STATUS)
  end

  def delete_all_items_from_trade
    # some code
  end

  def actualize_item_status
    # some code
  end
  
  private
  
  def link_generator
    @link_generator ||= LinkGenerator.new
  end
end
