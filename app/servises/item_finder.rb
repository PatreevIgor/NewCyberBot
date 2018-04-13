# frozen_string_literal: true

class ItemFinder
  def find_actuall_items
    last_50_sales.each do |item_hash|
      items_editor.create_item(item_hash) if item_validator.item_profitable?(item_hash) &&
                                             item_validator.item_not_exists?(item_hash)
      seller.create_order                 if item_validator.item_on_sale?(item_hash)
    end
  end

  private

  def last_50_sales
    Connection.send_request(Constant::LAST_50_SALES_URL)
  end

  def item_validator
    @item_validator ||= ItemValidator.new
  end

  def item_editor
    @items_editor ||= ItemsEditor.new
  end

  def seller
    @seller ||= Seller.new
  end
end
