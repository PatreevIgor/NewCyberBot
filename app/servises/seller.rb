# frozen_string_literal: true

class Seller
  def create_buy_orders(profitable_orders)
    profitable_orders.each do |order|
      Connection.send_request(format (Constant::CREATE_ORDER_URL, class_id:        item[class_id],
                                                                  instance_id:     item[instance_id],
                                                                  price:           price............,          
                                                                  your_secret_key: Rails.application.secrets.your_secret_key))
    end
    
    # users_informator.inform_user_about_created_order
  end
  
  def create_sell_order()
  end
  
  def delete_orders
    Connection.send_request(format (Constant::DELETE_ORDERS_URL, your_secret_key: Rails.application.secrets.your_secret_key))
  end

  private
    
  def users_informator
    @users_informator ||= UserInformator.new
  end
  
  def price
    @price ||= Price.new
  end
end
