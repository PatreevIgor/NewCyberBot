# frozen_string_literal: true

class Constant
  ITEM_HISTORY_URL    = 'https://market.dota2.net/api/ItemHistory/%<class_id>s_%<instance_id>s/?key=%<your_secret_key>s'
  BEST_BUY_OFFER_URL  = 'https://market.dota2.net/api/BestBuyOffer/'\
                        '%<class_id>s_%<instance_id>s/?key=%<your_secret_key>s'
  BEST_SELL_OFFER_URL = 'https://market.dota2.net/api/BestSellOffer/'\
                        '%<class_id>s_%<instance_id>s/?key=%<your_secret_key>s'

  HASH_MIN_KEY                   = 'min'
  HASH_MAX_KEY                   = 'max'
  HASH_AVERAGE_KEY               = 'average'
  ITEM_HASH_BEST_OFFER_KEY       = 'best_offer'

  # NEW_ITEMS_STATUS               = 'new'.freeze
  # MAIN_ITEMS_STATUS              = 'main'.freeze
  # ACTUALLY_MAIN_ITEMS_STATUS     = 'main_actually'.freeze
  # NOT_ACTUALLY_MAIN_ITEMS_STATUS = 'main_not_actually'.freeze
  # NOT_SALE_ITEMS_STATUS          = 'not sale'.freeze
  # SALE_ITEMS_STATUS              = 'sale on'.freeze

  # ITEM_HASH_CLASS_ID_KEY         = 'classid'.freeze
  # ITEM_HASH_INSTANCE_ID_KEY      = 'instanceid'.freeze
  # ITEM_HASH_PRICE_KEY            = 'price'.freeze
  # ITEM_HASH_HASH_NAME_KEY        = 'hash_name'.freeze
  # ITEM_INFO_HASH_MIN_PRICE_KEY   = 'min_price'.freeze

  # COUNT_FOUND_ITEMS_TEXT         = 'Found %{count_item} new items!'.freeze
  # ITEM_CREATED_TEXT              = 'Item created!'.freeze
  # REMOVED_ALL_TRADES_TEXT        = 'Removed all trades!'.freeze
  # WAIT_15_SEK_TEXT               = 'Wait 15 sec!'.freeze
  # NOT_SALE_ITEMS_UPDATED_TEXT    = 'Items (not sale) in my db updated!'.freeze
  # FINISHED_FILLING_TEXT          = 'Finished filling price_of_buy fields!'.freeze
  # PUT_UP_ALL_BOUGHT_ITEMS_TEXT   = 'Put up all bought items!'.freeze

  # LAST_50_SALES_URL              = 'https://market.dota2.net/history/json/'.freeze
  # DELETE_ORDERS_URL              = 'https://market.dota2.net/api/DeleteOrders/?key=%{your_secret_key}'.freeze
  # CREATE_ORDER_URL               = 'https://market.dota2.net/api/ProcessOrder/'\
  #                                  '%{class_id}/%{instance_id}/%{price}/?key=%{your_secret_key}'.freeze
  # ITEM_LINK_URL                  = 'https://market.dota2.net/item/'\
  #                                  '%{class_id}-%{instance_id}-%{i_market_hash_name}/'.freeze
  # NOT_SALE_ITEMS_URL             = 'https://market.dota2.net/api/GetInv/?key=%{your_secret_key}'.freeze
  # SALE_ITEMS_URL                 = 'https://market.dota2.net/api/GetMySellOffers/?key=%{your_secret_key}'.freeze
  # ITEM_INFORMATION_URL           = 'https://market.dota2.net/api/ItemInfo/'\
  #                                  '%{class_id}_%{instance_id}/ru/?key=%{your_secret_key}'.freeze
  # GET_ORDERS_LOG_URL             = 'https://market.dota2.net/api/GetOrdersLog/?key=%{your_secret_key}'.freeze
  # UPDATE_ORDER_URL               = 'https://market.dota2.net/api/UpdateOrder/'\
  #                                  '%{class_id}/%{instance_id}/%{price}/?key=%{your_secret_key}'.freeze
  # SET_PRICE_URL            = 'https://market.dota2.net/api/SetPrice/%{ui_id}/%{price}/?key=%{your_secret_key}'.freeze
  # REMOVE_ALL_URL           = 'https://market.dota2.net/api/RemoveAll/?key=%{your_secret_key}'.freeze
  # UPDATE_INVENTARY_URL     = 'https://market.dota2.net/api/UpdateInventory/?key=%{your_secret_key}'.freeze
end
