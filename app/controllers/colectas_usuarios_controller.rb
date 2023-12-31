class ColectasUsuariosController < ApplicationController
  def index
    @colectas = Colectum.all
  end
end
