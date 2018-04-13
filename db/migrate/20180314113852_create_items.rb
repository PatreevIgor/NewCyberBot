class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :class_id
      t.integer :instance_id
      t.string  :hash_name
      t.float   :price
      t.string  :link
      t.string  :status
      t.string  :ui_id
      t.string  :i_market_hash_name
      t.string  :i_market_name
      t.string  :i_name
      t.string  :i_name_color
      t.string  :i_rarity
      t.integer :ui_status
      t.string  :he_name
      t.float   :ui_price
      t.integer :min_price
      t.string  :ui_price_text
      t.boolean :min_price_text
      t.string  :i_classid
      t.string  :i_instanceid
      t.boolean :ui_new
      t.integer :position
      t.string  :wear
      t.integer :tradable
      t.float   :i_market_price
      t.string  :i_market_price_text
      t.string  :ui_real_instance
      t.string  :ui_bid
      t.string  :ui_asset
      t.string  :type_new
      t.integer :offer_live_time
      t.string  :placed

      t.timestamps
    end
  end
end
