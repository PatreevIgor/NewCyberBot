# frozen_string_literal: true

class Connection
  def self.send_request(url)
    uri           = URI.parse(url)
    response_json = Net::HTTP.get_response(uri)

    JSON.parse(response_json.body)
  end
  
  def self.send_post_request(url, order)
    uri           = URI.parse(url)
    list          = "#{order.classid}" + "_" + "#{order.instanceid}" # посмотреть в каком виде приходит ORDER, изменить синтаксис.

    response_post = Net::HTTP.post_form(uri, list).body # возможно ответ придет в JSONe и его надо распарсить
  end
end
