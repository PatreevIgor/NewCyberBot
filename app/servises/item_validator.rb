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
    Item.exists?(link: link_generator.generate_link(item_hash)) ? false : true
  end

  def item_on_sale?(item_hash)
  end

  private

  def coefficient_calculator
    @coefficient_calculator ||= CoefficientCalculator.new
  end
  
  def link_generator
    @link_generator ||= LinkGenerator.new
  end
end
