# frozen_string_literal: true

class CyberBot
  def start_work
    loop do
      perform_daily_tasks if Time.now > mode_change_time
      perform_night_tasks if Time.now < mode_change_time
    end
  end

  private

  def perform_daily_tasks
    ItemsFinder.find_actuall_items

    UsersInformator.inform_user_about_sell_items
  end

  def mode_change_time
    DateTime.now.change({ hour: 6, min: 30, sec: 0 })
  end

  def perform_night_tasks
    ItemsEditor.delete_all_items_from_trade

    ItemsEditor.actualize_item_status
  end
end
