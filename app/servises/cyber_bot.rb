# frozen_string_literal: true

class CyberBot
  def start_work
    loop do
      time_calculator.now_is_night? ? task_performer.perform_night_tasks : task_performer.perform_daily_tasks
    end
  end

  private

  def time_calculator
    @time_calculator ||= TimeCalculator.new
  end

  def task_performer
    @task_performer ||= TaskPerformer.new
  end
end
