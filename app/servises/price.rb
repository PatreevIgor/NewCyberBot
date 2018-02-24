# frozen_string_literal: true

class Price
  def get_max_price(item_hash)
    item_history(item_hash)[Constant::HASH_MAX_KEY]
  end

  def get_middle_price(item_hash)
    item_history(item_hash)[Constant::HASH_AVERAGE_KEY]
  end

  def get_min_price(item_hash)
    item_history(item_hash)[Constant::HASH_MIN_KEY]
  end

  def get_price_of_buy(item_hash)
    url = format(Constant::BEST_BUY_OFFER_URL, class_id:        item_hash['classid'],
                                               instance_id:     item_hash['instanceid'],
                                               your_secret_key: Rails.application.secrets.your_secret_key)
    price(url)
  end

  def get_price_of_sell(item_hash)
    url = format(Constant::BEST_SELL_OFFER_URL, class_id:        item_hash['classid'],
                                                instance_id:     item_hash['instanceid'],
                                                your_secret_key: Rails.application.secrets.your_secret_key)
    price(url)
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
