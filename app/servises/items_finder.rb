# frozen_string_literal: true

class ItemsFinder
  def find_actuall_items
    last_50_sales.each do |item_hash|
      if conditions_checker.check_conditions?(item_hash)
        # return actual items if they exist
      end
    end
  end

  private

  def last_50_sales
    Connection.send_request(Constant::LAST_50_SALES_URL)
  end

  def conditions_checker
    @conditions_checker ||= ConditionsChecker.new
  end
end
