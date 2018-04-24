class Order < ApplicationRecord
  def create_buy_orders(profitable_orders)
    profitable_orders.each do |order|
      Connection.send_request(format(Constant::CREATE_ORDER_URL, class_id:        order_info_hash(order)[Constant::ITEM_HASH_CLASS_ID_KEY],
                                                                 instance_id:     order_info_hash(order)[Constant::ITEM_HASH_INSTANCE_ID_KEY],
                                                                 price:           price.price_of_buy_for_order(order),
                                                                 your_secret_key: Rails.application.secrets.your_secret_key))
    telegram_chat_bot.send_message_create_buy_order
    end
    # users_informator.inform_user_about_created_order
  end
  
  # def delete_orders
  #   Connection.send_request(format (Constant::DELETE_ORDERS_URL, your_secret_key: Rails.application.secrets.your_secret_key))
  # end

  def create_order_in_db(item_hash)
    Order.create(class_id:    item_hash[Constant::ITEM_HASH_CLASS_ID_KEY],
                 instance_id: item_hash[Constant::ITEM_HASH_INSTANCE_ID_KEY],
                 hash_name:   item_hash[Constant::ITEM_HASH_HASH_NAME_KEY],
                 link:        link_generator.generate_link(item_hash),
                 status:      Constant::NOT_ACTUALIZED_ORDER_STATUS)
  end

  def actualize_orders
    non_actualized_orders = Order.where(status: [Constant::NOT_ACTUALIZED_ORDER_STATUS, Constant::UNPROFITABLE_ORDER_STATUS])
    non_actualized_orders.each do |order|
      if item_validator.item_profitable?(order_info_hash(order))
        order.status = Constant::PROFITABLE_ORDER_STATUS
        order.save
      else
        order.status = Constant::UNPROFITABLE_ORDER_STATUS
        order.save
      end
    end
  end

  def order_not_exists?(item_hash)
    Order.exists?(link: link_generator.generate_link(item_hash)) ? false : true
  end
  
  private

  def item_validator
    @item_validator ||= ItemValidator.new
  end

  def telegram_chat_bot
    @telegram_chat_bot ||= TelegramChatBot.new
  end

  def price
    @price ||= Price.new
  end

  def link_generator
    @link_generator ||= LinkGenerator.new
  end

  def order_info_hash(order)
    { Constant::ITEM_HASH_CLASS_ID_KEY => order.class_id, Constant::ITEM_HASH_INSTANCE_ID_KEY => order.instance_id }
  end
end
