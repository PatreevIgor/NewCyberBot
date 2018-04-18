# frozen_string_literal: true

class TaskPerformer
  def perform_daily_tasks
    actualize_not_actualized_orders
    create_buy_orders_for_profitable_orders
    item_finder.find_actuall_items
    # users_informator.inform_user_about_sell_items
  end

  def perform_night_tasks
    seller.delete_all_items_from_trade

    actualize_orders_and_items
  end

  private

  def actualize_not_actualized_orders
    order.actualize_orders if Order.where(status: NOT_ACTUALIZED_ORDER_STATUS).exist?
  end

  def create_buy_orders_for_profitable_orders
    if Order.where(status: ACTUALIZED_ORDER_STATUS).exist?
      profitable_orders = Orders.where(status: PROFITABLE_ORDER_STATUS)
      seller.create_buy_orders(profitable_orders)
    end
  end

  def item_finder
    @item_finder ||= ItemFinder.new
  end
    
  def users_informator
    @users_informator ||= UserInformator.new
  end

  def order
    @order ||= Order.new
  end
  
  def seller
    @seller ||= Seller.new
  end
end
