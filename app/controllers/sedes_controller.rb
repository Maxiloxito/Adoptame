class SedesController < ApplicationController
  before_action :set_organizacion
  before_action :set_sede, only: [:edit, :update, :destroy]

  def index
    @organizacion = Organizacion.find(params[:organizacione_id])
    @sedes = @organizacion.sedes
  end
  

  def new
    @organizacion = Organizacion.find(params[:organizacione_id])
    @sede = Sede.new
  end

  def edit
    @organizacion = Organizacion.find(params[:organizacione_id])
    @sede = Sede.find(params[:id])
  end
  
  def update
    @organizacion = Organizacion.find(params[:organizacione_id])
    @sede = Sede.find(params[:id])
    if @sede.update(sede_params)
      redirect_to organizacione_sedes_path(@organizacion), notice: 'Sede actualizada con éxito.'
    else
      render :edit
    end
  end

  def show
    @organizacion = Organizacion.find(params[:organizacione_id])
    @sede = Sede.find(params[:id])
  end
  

  def destroy
    @sede = Sede.find(params[:id])
    @sede.destroy
    redirect_to organizacione_sedes_path, notice: 'Sede eliminada con éxito.'
  end

  


  def create
    @sede = @organizacion.sedes.new(sede_params)
    if @sede.save
      redirect_to organizacione_sedes_path(@organizacion), notice: 'Sede creada con éxito.'
    else
      render :new
    end
  end

  
  private
  def set_organizacion
    @organizacion = Organizacion.find(params[:organizacione_id])
  end
  
  def set_sede
    @sede = Sede.find(params[:id])
  end

  def sede_params
    params.require(:sede).permit(:nombre, :direccion, :numero_contacto)
  end
end
