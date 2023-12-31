class ColectasController < ApplicationController
  before_action :set_organizacion
  before_action :set_colectum, only: [:show, :edit, :update, :destroy, :update_amount]



  def index
    @organizacion = Organizacion.find(params[:organizacione_id])
    @colectas = @organizacion.colectas
  end
  def new
    @organizacion = Organizacion.find(params[:organizacione_id])
    @colecta = Colectum.new
  end
  

  def create
    @organizacion = Organizacion.find(params[:organizacione_id])
    @colecta = @organizacion.colectas.build(colecta_params)
    if @colecta.save
      redirect_to organizacione_colectas_path(@organizacion), notice: 'Colecta creada con éxito.'
    else
      render :new
    end
  end


  def update
    @colectum = @organizacion.colectas.find(params[:id])
    if @colectum.update(colecta_params)
      redirect_to organizacione_colectas_path, notice: 'Colecta actualizada con éxito.'
    else
      render :edit
    end
  end

  def show
  end


  def destroy
    @colectum = Colectum.find(params[:id])
    @colectum.destroy
    redirect_to organizacione_colectas_path(params[:organizacione_id]), notice: 'Colecta eliminada con éxito.'
  end


  def edit
    @organizacion = Organizacion.find(params[:organizacione_id])
    @colecta = @organizacion.colectas.find(params[:id])
  end


  def update_amount
    @colecta = Colectum.find(params[:id])
    monto_a_sumar = params[:monto_a_sumar].to_f
  
    if monto_a_sumar.positive?
      @colecta.fondos_recaudados += monto_a_sumar
      if @colecta.save
        redirect_to organizacione_colectas_path(@organizacion), notice: 'Monto agregado con éxito.'
      else
        redirect_back(fallback_location: root_path, alert: 'Error al agregar al monto.')
      end
    else
      redirect_back(fallback_location: root_path, alert: 'Monto no especificado o inválido.')
    end
  end
  
  
  

  private

  def set_organizacion
    @organizacion = Organizacion.find(params[:organizacione_id])
  end

  def set_colectum
    @colecta = Colectum.find(params[:id])
    @organizacion = @colecta.organizacion
  end

  def colecta_params
    params.require(:colectum).permit(:nombre, :descripcion, :fecha_inicio, :fecha_fin, :meta, :fondos_recaudados)
  end
end
