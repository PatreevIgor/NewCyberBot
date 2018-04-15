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

  def actualize_orders
    # some code
  end

  def delete_all_items_from_trade
    # some code
  end

  def actualize_not_sale_items
    not_sale_items = Items.where(status: Constant::NOT_ACTUALIZED_ITEMS_STATUS)
    not_sale_items.each do |item|
      item_validator.item_profitable?(item_hash) ? item.status = 'profitable' : item.status = 'not profitable'
    end
    # return items with status "actualized"
  end
  
  private
  
  def convert_db_item_to_item_hash(item)
    { item.///////////////////////////////////////// }
  end
  
  def link_generator
    @link_generator ||= LinkGenerator.new
  end
end
