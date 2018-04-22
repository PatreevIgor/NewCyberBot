require 'telegram/bot'
require 'net/http'
require 'uri'

class TelegramChatBot
  def send_message_create_buy_order
    telegram_bot_client do |bot| 
      bot.api.send_message(chat_id: Rails.application.secrets.hide_user_id, text: Constant::TEXT_MESSAGE_CREATE_BUY_ORDER)
    end
  end

  private

  def telegram_bot_client(&block)
     Telegram::Bot::Client.run(Rails.application.secrets.hide_token, &block)
  end
end
