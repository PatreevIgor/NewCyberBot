# frozen_string_literal: true

# method coefficient_profit returns 100 if item is profit / returns 0 if item is not profit.
# method coefficient_current_state returns current position in percents from min to max.
# method coefficient_frequency_purchase returns 100 if item purchased every day one or better times
# and return 0 if items not sold within a month

class CoefficientCalculator
  def coefficient_profit(item_hash)
    # some code
  end

  def coefficient_current_state(item_hash)
    # some code
  end

  def coefficient_frequency_purchase(item_hash)
    # some code
  end

  private

  def price
    @price ||= Price.new
  end
end
