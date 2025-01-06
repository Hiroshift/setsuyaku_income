class HomeController < ApplicationController
  before_action :authenticate_user! # ログインしているユーザーのみアクセス可能

  def index
    today = Date.today

    # 今日の収入
    @today_income = current_user.recordings.where(recorded_date: today).sum(:amount)

    # 累計収入
    @total_income = current_user.recordings.sum(:amount)

    # 仮想労働時間（hourly_rate が 0 の場合は 0 時間）
    @virtual_work_time = if current_user.hourly_rate.positive?
                           (@today_income.to_f / current_user.hourly_rate).round(2)
                         else
                           0
                         end
  end

  def create
    amount = params[:amount].to_i
    if amount.positive?
      # 新しい記録をデータベースに保存
      if current_user.recordings.create(amount: amount, recorded_date: Date.today)
        flash[:notice] = "節約金額が記録されました！"
      else
        flash[:alert] = "記録に失敗しました。もう一度お試しください。"
      end
    else
      flash[:alert] = "節約金額を正しく入力してください。"
    end
    redirect_to root_path
  end
end
