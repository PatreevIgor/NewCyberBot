# frozen_string_literal: true

class ItemsFinder
  def find_actuall_items
    last_50_sales.each do |item_hash|
      if item_hash.filter_conditions?
        # return actual items if they exist
      end
    end
  end

  private

  def last_50_sales
    Connection.send_request(Constant::LAST_50_SALES_URL)
  end

  # def filter_conditions?
  #   # if CoefficientCalculator.coefficient_profit             > 80 &&
  #   #    coefficient_current_state      > 80
  #   #    coefficient_frequency_purchase > 80
  #   #    item_not_exists?(params)
  #   #   true
  #   # else
  #   #   false
  #   # end
  # end

  def item_not_exists?(params)
    # some code
  end
end
