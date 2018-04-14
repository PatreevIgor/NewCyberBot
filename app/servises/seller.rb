# frozen_string_literal: true

class Seller

  def create_orders(actual_items)
    
    users_informator.inform_user_about_created_order
  end

  private
    
  def users_informator
    @users_informator ||= UserInformator.new
  end
end
