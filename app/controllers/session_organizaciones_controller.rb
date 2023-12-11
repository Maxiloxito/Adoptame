class SessionOrganizacionesController < ApplicationController
  def new
  end


  #Manejo para el inicio de sesion y atentificacion para entrar al main
  def create
    organizacion = Organizacion.find_by(correo: params[:session][:correo].downcase)
    if organizacion && organizacion.authenticate(params[:session][:password])
      session[:user_id] = organizacion.id
      session[:user_type] = 'Organizacion'
      redirect_to organizacion_main_path, notice: 'Inicio de sesión exitoso.'
    else
      flash.now[:alert] = 'Correo o contraseña incorrecta.'
      render 'new'
    end
  end
end