# frozen_string_literal: true

class ItemValidator
  def item_profitable?(item_hash)
    if coefficient_calculator.coefficient_profit(item_hash)             > 80 &&
       coefficient_calculator.coefficient_current_state(item_hash)      > 80 &&
       coefficient_calculator.coefficient_frequency_purchase(item_hash) > 80 &&
      puts format(Constant::PROFITABLE_ITEM_TEXT,
                  coef_prof: coefficient_calculator.coefficient_profit(item_hash),
                  coef_cur_st: coefficient_calculator.coefficient_current_state(item_hash),
                  coef_fr_purch: coefficient_calculator.coefficient_frequency_purchase(item_hash))
      true
    else
      puts format(Constant::PROFITABLE_ITEM_TEXT,
                  coef_prof: coefficient_calculator.coefficient_profit(item_hash),
                  coef_cur_st: coefficient_calculator.coefficient_current_state(item_hash),
                  coef_fr_purch: coefficient_calculator.coefficient_frequency_purchase(item_hash))
      false
    end
  end

  def price_interval_is_valid?(item_hash)
    item_hash['price'] >= 30 and item_hash['price'] <= 150 ? true : false
  end
  
  private

  def coefficient_calculator
    @coefficient_calculator ||= CoefficientCalculator.new
  end
end
