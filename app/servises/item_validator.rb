# frozen_string_literal: true

# statuses of items:
# 1) on sale
# 2) in inventory

class ItemValidator
  def item_profitable?(item_hash)
    if coefficient_calculator.coefficient_profit(item_hash)             > 80 &&
       coefficient_calculator.coefficient_current_state(item_hash)      > 80 &&
       coefficient_calculator.coefficient_frequency_purchase(item_hash) > 80 &&
      true
    else
      false
    end
  end

  def item_not_exists?(item_hash)
    if Item.exists?(link: format(Constant::ITEM_LINK_URL, class_id:           params[:class_id],
                                                          instance_id:        params[:instance_id], 
                                                          i_market_hash_name: params[:hash_name].gsub(' ','+'))
      false
    else
      true
    end
  end

  def item_on_sale?(item_hash)
  end

  private

  def coefficient_calculator
    @coefficient_calculator ||= CoefficientCalculator.new
  end
end
