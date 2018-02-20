# frozen_string_literal: true

class ItemsFinder
  def find_actuall_items
    last_50_sales.each do |hash_items|

      [actuall_items]
    end
  end

  private

  def last_50_sales
    Connection.send_request(Constant::LAST_50_SALES_URL)
  end
end
