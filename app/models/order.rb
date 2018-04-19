class Order < ApplicationRecord
  def create_order(item_hash)
    Order.create(class_id:    item_hash[:class_id],
                 instance_id: item_hash[:instance_id],
                 hash_name:   item_hash[:hash_name],
                 link:        link_generator.generate_link(item_hash),
                 status:      Constant::PROFITABLE_ORDER_STATUS)
  end

  def actualize_orders
    non_actualized_orders = Order.where(status: [NOT_ACTUALIZED_ORDER_STATUS, UNPROFITABLE_ORDER_STATUS])
    non_actualized_orders.each do |order|
      if item_validator.item_profitable?(order_info_hash(order))
        order.status = PROFITABLE_ORDER_STATUS
      else
        order.status = UNPROFITABLE_ORDER_STATUS
      end
    end
  end

  
def order.order_not_exists?(item_hash)
    Item.exists?(link: link_generator.generate_link(item_hash)) ? false : true
end
  
  
  private

  def item_validator
    @item_validator ||= ItemValidator.new
  end

  def order_info_hash(order)
    { "classid" => order.class_id, "instanceid" => order.instance_id }
  end
end
