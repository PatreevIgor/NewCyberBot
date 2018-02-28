# frozen_string_literal: true

class TaskPerformer
  def perform_daily_tasks
    item_finder.find_actuall_items

    users_informator.inform_user_about_sell_items
  end

  def perform_night_tasks
    items_editor.delete_all_items_from_trade

    items_editor.actualize_item_status
  end

  private

  def item_finder
    @item_finder ||= ItemsFinder.new
  end

  def users_informator
    @users_informator ||= ItemsFinder.new
  end

  def items_editor
    @items_editor ||= ItemsEditor.new
  end
end
