# frozen_string_literal: true

class ConditionsChecker
  def filter_conditions?(item_hash)
    # some code
  end

  private

  def coefficient_calculator
    @coefficient_calculator ||= CoefficientCalculator.new
  end
end
