# frozen_string_literal: true

module Helpers
  def five_days_ago
    (Time.now.to_i - 464_800).to_s
  end

  def one_week_ago
    (Time.now.to_i - 864_800).to_s
  end

  def one_week_ago_other_time
    (Time.now.to_i - 864_805).to_s
  end

  def two_weeks_ago
    (Time.now.to_i - 1_364_800).to_s
  end

  def more_month_days_ago
    (Time.now.to_i - 4_964_800).to_s
  end
end
