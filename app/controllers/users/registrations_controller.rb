class Users::RegistrationsController < Devise::RegistrationsController
  protected

  # パスワードなしで情報を更新できるようにする
  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank?
      resource.update_without_password(params)
    else
      resource.update(params)
    end
  end

  # サインアップ後のリダイレクト先を指定
  def after_sign_up_path_for(_resource)
    root_path # ホーム画面に遷移
  end

  # アカウント削除後のリダイレクト先を指定
  def after_destroy_path_for(_resource)
    root_path # ホーム画面に遷移
  end
end
