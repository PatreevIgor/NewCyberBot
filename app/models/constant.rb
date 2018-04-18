# frozen_string_literal: true

class Constant
  # URLS
  ITEM_HISTORY_URL    = 'https://market.dota2.net/api/ItemHistory/%<class_id>s_%<instance_id>s/?key=%<your_secret_key>s'
  BEST_BUY_OFFER_URL  = 'https://market.dota2.net/api/BestBuyOffer/'\
                        '%<class_id>s_%<instance_id>s/?key=%<your_secret_key>s'
  BEST_SELL_OFFER_URL = 'https://market.dota2.net/api/BestSellOffer/'\
                        '%<class_id>s_%<instance_id>s/?key=%<your_secret_key>s'
  ITEM_LINK_URL       = 'https://market.dota2.net/item/'\
                        '%<class_id>s-%<instance_id>s-%<i_market_hash_name>s/'
  DELETE_ORDERS_URL   = 'https://market.dota2.net/api/DeleteOrders/?key=%<your_secret_key>s'
  REMOVE_ALL_URL      = 'https://market.dota2.net/api/RemoveAll/?key=%<your_secret_key>s'
  
  # HASH KEYS
  HASH_MIN_KEY        = 'min'
  HASH_MAX_KEY        = 'max'
  HASH_AVERAGE_KEY    = 'average'
  HASH_BEST_OFFER_KEY = 'best_offer'

  # ORDER STATUSES
  NOT_ACTUALIZED_ORDER_STATUS = 'not_actualized_order'
  CREATED_ORDER_STATUS        = 'created_order'
  UNPROFITABLE_ORDER_STATUS   = 'unprofitable_order'
  PROFITABLE_ORDER_STATUS     = 'profitable_order'

  # ITEM STATUSES
  ON_SALE_ITEM_STATUS      = 'on_sale'
  IN_INVENTARY_ITEM_STATUS = 'in_inventory'

  # ITEM_HASH_CLASS_ID_KEY         = 'classid'
  # ITEM_HASH_INSTANCE_ID_KEY      = 'instanceid'
  # ITEM_HASH_PRICE_KEY            = 'price'
  # ITEM_HASH_HASH_NAME_KEY        = 'hash_name'
  # ITEM_INFO_HASH_MIN_PRICE_KEY   = 'min_price'

  # COUNT_FOUND_ITEMS_TEXT         = 'Found %{count_item} new items!'
  # ITEM_CREATED_TEXT              = 'Item created!'
  # REMOVED_ALL_TRADES_TEXT        = 'Removed all trades!'
  # WAIT_15_SEK_TEXT               = 'Wait 15 sec!'
  # NOT_SALE_ITEMS_UPDATED_TEXT    = 'Items (not sale) in my db updated!'
  # FINISHED_FILLING_TEXT          = 'Finished filling price_of_buy fields!'
  # PUT_UP_ALL_BOUGHT_ITEMS_TEXT   = 'Put up all bought items!'

  # LAST_50_SALES_URL              = 'https://market.dota2.net/history/json/'.freeze
  # CREATE_ORDER_URL               = 'https://market.dota2.net/api/ProcessOrder/'\
  #                                  '%{class_id}/%{instance_id}/%{price}/?key=%{your_secret_key}'.freeze

  # NOT_SALE_ITEMS_URL             = 'https://market.dota2.net/api/GetInv/?key=%{your_secret_key}'.freeze
  # SALE_ITEMS_URL                 = 'https://market.dota2.net/api/GetMySellOffers/?key=%{your_secret_key}'.freeze
  # ITEM_INFORMATION_URL           = 'https://market.dota2.net/api/ItemInfo/'\
  #                                  '%{class_id}_%{instance_id}/ru/?key=%{your_secret_key}'.freeze
  # GET_ORDERS_LOG_URL             = 'https://market.dota2.net/api/GetOrdersLog/?key=%{your_secret_key}'.freeze
  # UPDATE_ORDER_URL               = 'https://market.dota2.net/api/UpdateOrder/'\
  #                                  '%{class_id}/%{instance_id}/%{price}/?key=%{your_secret_key}'.freeze
  # SET_PRICE_URL            = 'https://market.dota2.net/api/SetPrice/%{ui_id}/%{price}/?key=%{your_secret_key}'.freeze
  # UPDATE_INVENTARY_URL     = 'https://market.dota2.net/api/UpdateInventory/?key=%{your_secret_key}'.freeze
end
