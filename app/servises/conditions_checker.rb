# frozen_string_literal: true

class ConditionsChecker
  def check_conditions?(item_hash)
    if coefficient_calculator.coefficient_profit(item_hash)             > 80 &&
       coefficient_calculator.coefficient_current_state(item_hash)      > 80 &&
       coefficient_calculator.coefficient_frequency_purchase(item_hash) > 80 &&
       item_checker.item_not_exists?(item_hash)
      true
    else
      false
    end
  end

  private

  def coefficient_calculator
    @coefficient_calculator ||= CoefficientCalculator.new
  end

  def item_checker
    @item_checker ||= ItemChecker.new
  end
end
