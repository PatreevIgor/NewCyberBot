# frozen_string_literal: true

class TimeCalculator
  def now_is_night?
    return true if Time.now < morning && Time.now > midnight
  end

  private

  def midnight
    Time.now.change(hour: 0, min: 0, sec: 0)
  end

  def morning
    Time.now.change(hour: 6, min: 30, sec: 0)
  end
end
