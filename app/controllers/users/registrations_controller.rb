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
end