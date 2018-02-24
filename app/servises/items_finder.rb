# frozen_string_literal: true

class ItemsFinder
  def find_actuall_items
    last_50_sales.each do |item_hash|
      item_hash
      # return actual items if they exist
    end
  end

  private

  def last_50_sales
    Connection.send_request(Constant::LAST_50_SALES_URL)
  end

  def filter_conditions?
    # if params[:current_price].to_f > min_price(params)                  &&
    #    params[:current_price].to_f > params[:from_price_input_val].to_i &&
    #    params[:current_price].to_f < params[:to_price_input_val].to_i   &&
    #    item_not_exists?(params)
    #   true
    # else
    #   false
    # end
  end

  def item_not_exists?(params)
    # some code
  end
end
