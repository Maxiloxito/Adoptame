class AnimalsController < ApplicationController
  before_action :verify_is_organizacion, only: [:new, :create]
  before_action :set_current_organizacion, only: [:new]

  def index
    @animals = Animal.where.not(id: Adopcion.where(estado: 'Aceptado').select(:animal_id))
  end

  def new
    @animal = Animal.new
    @animal.fotos.build
    @current_organizacion = current_user if current_user.is_a?(Organizacion)

  end
 
  def create
    @animal = Animal.new(animal_params)
    @current_organizacion = current_user if current_user.is_a?(Organizacion)
    @animal.id_organizacion = current_user.id 
    if @animal.save
      redirect_to organizacion_main_path, notice: 'Animal creado exitosamente.'
    else
      render :new
    end
  end
 
  def show
    @animal = Animal.find(params[:id])
  end
 
  private
 
  def animal_params
    params.require(:animal).permit(
      :nombre, :raza, :edad_age, :edad_month, :color, :tipo_animal, :tipo_animal_personalizado, 
      :descripcion, :comportamiento, :sede_id, :vacunas, :esterilizado,
      fotos_attributes: [:id, :imagen, :imagen2, :imagen3, :_destroy]
    )
  end
   
  def set_current_organizacion
    @current_organizacion = current_user if current_user.is_a?(Organizacion)
  end
  def require_organizacion
    unless current_user && current_user.is_a?(Organizacion)
      redirect_to root_url, alert: 'No tienes permiso para realizar esta acción.'
    end
  end
end
 