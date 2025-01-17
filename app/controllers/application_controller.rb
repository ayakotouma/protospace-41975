class ApplicationController < ActionController::Base
  # Deviseコントローラーの前にストロングパラメータを設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  # Deviseのストロングパラメータにカスタムフィールドを追加
  def configure_permitted_parameters
    # サインアップ時に許可するパラメータ
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
    # アカウント更新時に許可するパラメータ（必要であれば記述）
    # devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :occupation, :position])

  end

end
