class HomeController < ApplicationController
  def index
    @today_income = 0
    @virtual_work_time = 0
    @total_income = 0
  end
end
