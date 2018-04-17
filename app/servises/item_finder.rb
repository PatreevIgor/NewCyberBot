# frozen_string_literal: true

class ItemFinder
  def find_actuall_items
    last_50_sales.each do |item_hash|
      if validator.profitable?(item_hash) && item.item_not_exists?(item_hash)
        item.create_item(item_hash)
      end
      seller.create_order if item_validator.item_on_sale?(item_hash)
    end
  end

  private

  def last_50_sales
    Connection.send_request(Constant::LAST_50_SALES_URL)
  end

  def validator
    @validator ||= Validator.new
  end

  def item
    @item ||= Item.new
  end

  def seller
    @seller ||= Seller.new
  end
end
