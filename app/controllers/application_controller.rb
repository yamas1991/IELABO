class ApplicationController < ActionController::Base
  #deviceの機能使ったら↓の記述が必ず必要
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:email])
    end
end
