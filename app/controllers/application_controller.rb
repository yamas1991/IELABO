class ApplicationController < ActionController::Base
  #deviceの機能使ったら↓の記述が必ず必要
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_path
    when User
      users_path
    end
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:email])
    end
end
