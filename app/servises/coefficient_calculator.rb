# frozen_string_literal: true

# method coefficient_profit returns 100 if item is profit / returns 0 if item is not profit.
# method coefficient_current_state returns current position in percents from min to max.
# method coefficient_frequency_purchase returns 100 if item purchased every day one or better times
#   and return 0 if items not sold within a month

class CoefficientCalculator
  def coefficient_profit(item_hash)
    clean_benefit(item_hash) >= 2000 ? 100 : 0
  end

  def coefficient_current_state(item_hash)
    dposam(item_hash) <= 0 ? 0 : 100 - (dmam(item_hash) - dposam(item_hash)) * 100 / dmam(item_hash)
  end

  def coefficient_frequency_purchase(history_of_sales)
    hash_of_sales = {}
    history_of_sales.each do |item|
      break if count_days_ago(item) > 30

      if hash_of_sales[count_days_ago(item)]
        hash_of_sales[count_days_ago(item)] += 1
      else
        hash_of_sales[count_days_ago(item)] = 1
      end
    end

    count_coefficient_frequency_purchase(hash_of_sales)
  end

  private

  def clean_benefit(item_hash)
    price.price_of_sell(item_hash) - price.price_of_buy(item_hash) - price.price_of_sell(item_hash) / 100 * 10
  end

  def dposam(item_hash)
    @dposam ||= Price.new.diff_price_of_sell_and_min(item_hash)
  end

  def dmam(item_hash)
    @dmam ||= Price.new.diff_middle_and_min(item_hash)
  end

  def count_days_ago(item)
    (Time.now.to_i - item['l_time'].to_i) / 60 / 60 / 24
  end

  def count_coefficient_frequency_purchase(hash_of_sales)
    format('%.2f', hash_of_sales.size * 100 / 30).to_i
  end
end
