# frozen_string_literal: true

class ItemValidator
  def profitable?(info_hash)
    if coefficient_calculator.coefficient_profit(item_hash)             > 80 &&
       coefficient_calculator.coefficient_current_state(item_hash)      > 80 &&
       coefficient_calculator.coefficient_frequency_purchase(item_hash) > 80 &&
      true
    else
      false
    end
  end

  private

  def coefficient_calculator
    @coefficient_calculator ||= CoefficientCalculator.new
  end
end
