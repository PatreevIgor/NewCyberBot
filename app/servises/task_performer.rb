# frozen_string_literal: true

# 

class TaskPerformer
  def perform_daily_tasks
    актуализировать статус созданных вещей в БД
    выставить на продажу актуализированные вещи
    
    seller.create_orders(item_finder.find_actuall_items)
    # users_informator.inform_user_about_sell_items
  end

  def perform_night_tasks
    items_editor.delete_all_items_from_trade

    items_editor.actualize_all_items
  end

  private

  def item_finder
    @item_finder ||= ItemFinder.new
  end
    
  def users_informator
    @users_informator ||= UserInformator.new
  end

  def items_editor
    @items_editor ||= ItemsEditor.new
  end
  
  def seller
    @seller ||= Seller.new
  end
end
