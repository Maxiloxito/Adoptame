class OrganizacionesController < ApplicationController
  def adopciones
    @adopciones = Adopcion.all
  end
  
  def new
    @organizacion = Organizacion.new
  end

  def create
    @organizacion = Organizacion.new(organizacion_params)
    if @organizacion.save
      # Redirige al inicio de sesión para organizaciones
      redirect_to organizaciones_login_path, notice: 'Registro exitoso. Por favor inicia sesión.'
    else
      render 'new'
    end
  end

  private

  def organizacion_params
    params.require(:organizacion).permit(:nombre, :direccion, :numero_contacto, :logo, :colectas_asociadas, :password, :password_confirmation, :correo)
  end
  
end
