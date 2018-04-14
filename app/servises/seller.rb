# frozen_string_literal: true

class Seller
  def create_orders(actual_items)
    actual_items.each do |item|
      Connection.send_request(format (Constant::CREATE_ORDER_URL, class_id:        item[class_id],
                                                                  instance_id:     item[instance_id],
                                                                  price:           item[price],          
                                                                  your_secret_key: Rails.application.secrets.your_secret_key))
    end
    
    users_informator.inform_user_about_created_order
  end
  
  def delete_orders
    Connection.send_request(format (Constant::DELETE_ORDERS_URL, your_secret_key: Rails.application.secrets.your_secret_key))
  end

  private
    
  def users_informator
    @users_informator ||= UserInformator.new
  end
end
