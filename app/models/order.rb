class Order < ApplicationRecord
  def create_order(order_hash)
    Item.create(class_id:    order_hash[:class_id],
                instance_id: order_hash[:instance_id],
                hash_name:   order_hash[:hash_name],
                price:       order_hash[:current_price],
                link:        link_generator.generate_link(order_hash),
                status:      Constant::NEW_ITEMS_STATUS)
  end

  def actualize_orders
    non_actualized_orders = Order.where(status: [NOT_ACTUALIZED_ORDER_STATUS, UNPROFITABLE_ORDER_STATUS])
    non_actualized_orders.each do |order|
      if validator.profitable?(order_info_hash(order))
        order.status = PROFITABLE_ORDER_STATUS
      else
        order.status = UNPROFITABLE_ORDER_STATUS
      end
    end
  end

  private

  def validator
    @validator ||= Validator.new
  end

  def order_info_hash(order)
    { "classid" => order.class_id, "instanceid" => order.instance_id }
  end
end
