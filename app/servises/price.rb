# frozen_string_literal: true

class Price
  
  # ------------------------------------------ for creating orders -------------------------------------------
  
  def price_of_sell_for_order(item) # цена продажи вещи на создаваемом ордере
    if item_never_sold?(item)
      price_of_never_sold_order
    elsif order_other_user_not_exist?(item)                        
      max_price_of_sales_from_history
    else
      appropriate_price(item)
    end
  end
  
  def item_never_sold?(item)
    true if min_price_of_sales_from_history({ class_id: item.class_id, instance_id: item.instance_id }) == 1 &&
            max_price_of_sales_from_history({ class_id: item.class_id, instance_id: item.instance_id }) == 2  
  end
  
  def price_of_never_sold_order
    item.price_of_buy / 100 * 110 + 3000
  end
    
  def order_other_user_not_exist?(item)
    true if (item_informations(item.class_id, item.instance_id)[Constant::ITEM_INFO_HASH_MIN_PRICE_KEY] == -1)
  end
  
  def min_price_of_sales_from_history(params)
    min_middle_max_prices = get_hash_min_middle_max_prices(params)

    min_price = min_middle_max_prices[Constant::HASH_MIN_KEY].to_f
  end
  
  def max_price_of_sales_from_history(params)
    min_middle_max_prices = get_hash_min_middle_max_prices(params)
    
    max_price = min_middle_max_prices[Constant::HASH_MAX_KEY].to_f
  end
  
  def get_hash_min_middle_max_prices(params)
    url = format(Constant::ITEM_HISTORY_URL, class_id:        params[:class_id].to_s,
                                             instance_id:     params[:instance_id].to_s,
                                             your_secret_key: Rails.application.secrets.your_secret_key)
    response = Connection.send_request(url)
    create_hash_min_middle_max_prices(response)
  end
  
  def create_hash_min_middle_max_prices(response) # в будущем передаелать метод с обработкой ошибок
    min_middle_max_prices = {}

    response[Constant::HASH_MIN_KEY] ?
    (min_middle_max_prices[Constant::HASH_MIN_KEY] = response[Constant::HASH_MIN_KEY]/100) :
    (min_middle_max_prices[Constant::HASH_MIN_KEY] = 100/100)

    response[Constant::HASH_MAX_KEY] ?
    (min_middle_max_prices[Constant::HASH_MAX_KEY] = response[Constant::HASH_MAX_KEY]/100) :
    (min_middle_max_prices[Constant::HASH_MAX_KEY] = 200/100)

    response[Constant::HASH_AVERAGE_KEY] ?
    (min_middle_max_prices[Constant::HASH_AVERAGE_KEY] = response[Constant::HASH_AVERAGE_KEY]/100) :
    (min_middle_max_prices[Constant::HASH_MAX_KEY]     = 150/100)

    min_middle_max_prices
  end
  
  def appropriate_price(item)
    if min_price_of_orders_to_buy(item.class_id, item.instance_id) < min_favorable_price(item)
      min_favorable_price(item)
    else
      min_price_of_orders_to_buy(item.class_id, item.instance_id)
    end
  end
  
  def min_price_of_orders_to_buy(class_id, instance_id)
    item_informations(class_id, instance_id)[Constant::ITEM_INFO_HASH_MIN_PRICE_KEY].to_f - 0001
  end
  
  def min_favorable_price(item)
    sprintf("%.0f", (item.price_of_buy / 100 * 110 + 1000)).to_f
  end
  
  def item_informations(class_id, instance_id)
    Connection.send_request(format(Constant::ITEM_INFORMATION_URL, class_id:        class_id, 
                                                                   instance_id:     instance_id, 
                                                                   your_secret_key: Rails.application.secrets.your_secret_key))
  end
    
  
  # ------------------------------------ for count coefficients --------------------------------------------
  
  def curr_max_price(item_hash) # максимальная цена, используется для расчета коэффициентов
    item_history(item_hash)[Constant::HASH_MAX_KEY]
  end

  def curr_middle_price(item_hash) # средняя цена, используется для расчета коэффициентов
    item_history(item_hash)[Constant::HASH_AVERAGE_KEY]
  end

  def curr_min_price(item_hash) # минимальная цена, используется для расчета коэффициентов
    item_history(item_hash)[Constant::HASH_MIN_KEY]
  end

  def curr_price_of_buy(item_hash) # текущая цена покупки
    url = format(Constant::BEST_BUY_OFFER_URL, class_id:        item_hash['classid'],
                                               instance_id:     item_hash['instanceid'],
                                               your_secret_key: Rails.application.secrets.your_secret_key)
    price(url)
  end

  def curr_price_of_sell(item_hash) # текущая цена продажи
    url = format(Constant::BEST_SELL_OFFER_URL, class_id:        item_hash['classid'],
                                                instance_id:     item_hash['instanceid'],
                                                your_secret_key: Rails.application.secrets.your_secret_key)
    price(url)
  end

  def diff_curr_middle_and_curr_min(item_hash) # разница между средней и минимальной ценой
    curr_middle_price(item_hash) - curr_min_price(item_hash)
  end

  def diff_curr_price_of_sell_and_curr_min(item_hash) # разница между ценой продажи и минимальной ценой
    curr_price_of_sell(item_hash) - curr_min_price(item_hash)
  end

  private

  def item_history(item_hash)
    url = format(Constant::ITEM_HISTORY_URL, class_id:        item_hash[:class_id].to_s,
                                             instance_id:     item_hash[:instance_id].to_s,
                                             your_secret_key: Rails.application.secrets.your_secret_key)

    Connection.send_request(url)
  end

  def price(url)
    response = Connection.send_request(url)

    response[Constant::ITEM_HASH_BEST_OFFER_KEY].to_i
  end
end
