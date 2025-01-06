class HomeController < ApplicationController
  before_action :authenticate_user! # ログインしているユーザーのみアクセス可能

  def index
    @today_income = 0
    @virtual_work_time = 0
    @total_income = 0
  end

  def create
    amount = params[:amount].to_i
    if amount.positive?
      # 新しい記録をデータベースに保存
      current_user.recordings.create(amount: amount, recorded_date: Date.today)
      flash[:notice] = "節約金額が記録されました！"
    else
      flash[:alert] = "節約金額を正しく入力してください。"
    end
    redirect_to root_path
  end
end
