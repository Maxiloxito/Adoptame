class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_organizacion
  
    private
  
    def current_user
        return nil unless session[:user_id] && session[:user_type]
      
        @current_user ||= 
          if session[:user_type] == 'Usuario'
            Usuario.find_by(id: session[:user_id])
          else
            Organizacion.find_by(id: session[:user_id])
          end
      end
      
    def user_signed_in?
      current_user.present?
    end

    protected

    def verify_is_organizacion
      unless current_user && current_user.is_a?(Organizacion)
        redirect_to root_path, alert: 'No tienes permiso para acceder a esta página.'
      end
    end
  
    
  
end
  