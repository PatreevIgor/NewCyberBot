class Item < ApplicationRecord
  def create_item(item_hash)
    Item.create(class_id:    item_hash[:class_id],
                instance_id: item_hash[:instance_id],
                hash_name:   item_hash[:hash_name],
                price:       item_hash[:current_price],
                link:        link_generator.generate_link(item_hash),
                status:      Constant::NEW_ITEMS_STATUS)
  end

  def actualize_not_sale_items
    # not_sale_items = Items.where(status: Constant::NOT_ACTUALIZED_ITEMS_STATUS)
    # not_sale_items.each do |item|
    #   item_validator.item_profitable?(item_hash) ? item.status = 'profitable' : item.status = 'not profitable'
    # end
    # return items with status "actualized"
  end

  def self.delete_all_items_from_trade
    Connection.send_request(format(Constant::REMOVE_ALL_URL, your_secret_key: Rails.application.secrets.your_secret_key))
    change_items_status_to_in_inventary
  end

  def item_not_exists?(item_hash)
    Item.exists?(link: link_generator.generate_link(item_hash)) ? false : true
  end

  def item_on_sale?(item_hash)
  end

  private

  def change_items_status_to_in_inventary
    on_sale_items = Item.where(status: ON_SALE_ITEM_STATUS)
    if on_sale_items.exist?
      on_sale_items.each do |item|
        item.status = Constant::IN_INVENTARY_ITEM_STATUS
      end
    end
  end
  
  def link_generator
    @link_generator ||= LinkGenerator.new
  end
end
