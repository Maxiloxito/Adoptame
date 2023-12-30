class ColectasController < ApplicationController
  before_action :set_organizacion
  before_action :set_colectum, only: [:show, :edit, :update, :destroy]



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
  
  private
  def set_organizacion
    @organizacion = Organizacion.find(params[:organizacione_id])
  end

  def set_colectum
    @colectum = @organizacion.colectas.find(params[:id])
  end

  def colecta_params
    params.require(:colectum).permit(:nombre, :descripcion, :fecha_inicio, :fecha_fin, :meta)
  end
end
