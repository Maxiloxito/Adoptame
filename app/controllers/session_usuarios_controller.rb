class SessionUsuariosController < ApplicationController
  def new
  end

  def create
    usuario = Usuario.find_by(correo: params[:session][:correo].downcase)
    if usuario && usuario.authenticate(params[:session][:password])
      session[:user_id] = usuario.id
      session[:user_type] = 'Usuario'
      redirect_to usuario_main_path, notice: 'Inicio de sesión exitoso.'
    else
      flash.now[:alert] = 'Correo o contraseña incorrecta.'
      render 'new'
    end
  end
end