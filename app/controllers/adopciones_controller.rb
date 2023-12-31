class AdopcionesController < ApplicationController
  before_action :set_animal, only: [:new, :create, :show]
  before_action :authenticate_user!, only: [:new, :create]


  def new
    @animal = Animal.find(params[:animal_id])
    @adopcion = Adopcion.new
  end

  def create
    @adopcion = Adopcion.new(adopcion_params)
    @adopcion.usuario = current_user
    @adopcion.animal = @animal
    @adopcion.correo = current_user.correo
    @adopcion.numero_contacto = current_user.numero_contacto
  
    if @adopcion.save
      redirect_to @animal, notice: 'La solicitud de adopción ha sido enviada.'
    else
      render :new
    end
  end
  
  def show
    @adopcion = Adopcion.find(params[:id])

  end

  def accept
    @adopcion = Adopcion.find(params[:id])
    @adopcion.update(estado: 'Aceptado')
    message = "La organizacion #{@adopcion.animal.organizacion.nombre} ha aceptado tu solicitud de adopción para #{@adopcion.animal.nombre}. Por favor, comunícate con la organización lo antes posible."
    whatsapp_url = "https://wa.me/#{+56991620489}?text=#{URI.encode_www_form_component(message)}"
    redirect_to whatsapp_url, allow_other_host: true
  end
  
  def reject
    @adopcion = Adopcion.find(params[:id])
    @adopcion.update(estado: 'Rechazado')
    message = "La organizacion #{@adopcion.animal.organizacion.nombre} ha aceptado tu solicitud de adopción para #{@adopcion.animal.nombre}. Por favor, comunícate con la organización lo antes posible."
    whatsapp_url = "https://wa.me/#{+56991620489}?text=#{URI.encode_www_form_component(message)}"
    redirect_to whatsapp_url, allow_other_host: true
  end
  private

  def set_animal
    @animal = Animal.find(params[:animal_id])
  end

  def adopcion_params
    params.require(:adopcion).permit(:razon, :experiencia, :compromiso_cuidado, :correo, :numero_contacto)
  end
  

  def authenticate_user!
    redirect_to root_path, alert: 'Debes iniciar sesión para continuar.' unless user_signed_in?
  end
end
