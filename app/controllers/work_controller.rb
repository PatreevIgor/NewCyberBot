# frozen_string_literal: true

class WorkController < ApplicationController
  def button_start
    CyberBot.start_work
  end
end
