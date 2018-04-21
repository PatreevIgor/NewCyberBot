# frozen_string_literal: true

class ItemValidator
  def item_profitable?(item_hash)
    #puts 'coef-fr_pur =' + coefficient_calculator.coefficient_frequency_purchase(item_hash).to_s


    if coefficient_calculator.coefficient_profit(item_hash)             > 80 &&
       coefficient_calculator.coefficient_current_state(item_hash)      > 80 #&&
       #coefficient_calculator.coefficient_frequency_purchase(item_hash) > 10
      puts 'coef-profit =' + coefficient_calculator.coefficient_profit(item_hash).to_s
      puts 'coef-cur_st =' + coefficient_calculator.coefficient_current_state(item_hash).to_s
      true
    else
      false
    end
  end

  def price_interval_is_valid?(item_hash)
    item_hash['price'] >= 10 and item_hash['price'] <= 150 ? true : false # цены вынети в конфигурационный файл
  end
  
  private

  def coefficient_calculator
    @coefficient_calculator ||= CoefficientCalculator.new
  end
end
