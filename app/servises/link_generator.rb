# frozen_string_literal: true

class LinkGenerator
  def generate_link(item_hash)
    format(Constant::ITEM_LINK_URL, class_id:           item_hash[:class_id],
                                    instance_id:        item_hash[:instance_id], 
                                    i_market_hash_name: item_hash[:hash_name].gsub(' ','+')),
  end
end
