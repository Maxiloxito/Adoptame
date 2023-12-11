class UsuariosController < ApplicationController
  before_action :require_login, only: [:main]
  
  def main
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save 
      # Redirige al inicio de sesión para usuarios
      redirect_to usuarios_login_path, notice: 'Registro exitoso. Por favor inicia sesión.'
    else
      render 'new'
    end
  end


  def adopciones
    @adopciones = current_user.adopciones
  end

  
  private

  def usuario_params
    params.require(:usuario).permit(:nombre, :apellido, :edad, :correo, :numero_contacto, :oficio, :password)
  end


  #Pide que se loguee para entrar al main
  def require_login
    unless session[:usuario_id]
      flash[:error] = "Debes iniciar sesión para acceder a esta sección"
      redirect_to new_session_usuarios_path
    end
  end



end

