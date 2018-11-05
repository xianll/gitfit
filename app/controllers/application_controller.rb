class ApplicationController < ActionController::Base
    include Pundit

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      permit_attrs(%i[first_name last_name])
    end
  
    def permit_attrs(attrs)
      %i[sign_up account_update].each do |action|
        devise_parameter_sanitizer.permit(action, keys: attrs)
      end
    end

    # class ApplicationController < ActionController::Base
    #     before_action :configure_permitted_parameters, if: :devise_controller?
    
    #     protected
      
    #     def configure_permitted_parameters
    #       devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    #     end
    #     def configure_account_update_params
    #         devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    #     end
    #   end
end
