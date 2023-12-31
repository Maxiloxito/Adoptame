Rails.application.routes.draw do
  get 'sedes/index'
  get 'sedes/new'
  get 'sedes/create'
  get 'sedes/edit'
  get 'sedes/update'
  get 'sedes/destroy'
  get 'colectas_usuarios/index'
  get 'colecta/index'
  get 'colecta/new'
  get 'colecta/edit'
  get 'adopciones/new'
  get 'adopciones/create'

  root 'home#index'

  
  # Rutas para Usuarios
  get 'usuarios/sign_up', to: 'usuarios#new'
  post 'usuarios', to: 'usuarios#create'
  get 'usuarios/login', to: 'session_usuarios#new'
  post 'usuarios/login', to: 'session_usuarios#create'

  # Ruta para el main de usuarios
  get 'usuarios/main', to: 'usuarios#main', as: :usuario_main

  # Redirecciona a la pagina main para los USUARIOS que inician sesion
  get 'session_usuarios/new', to: 'session_usuarios#new', as: :new_session_usuarios
  post 'session_usuarios', to: 'session_usuarios#create', as: :session_usuarios


  

  # Rutas para Organizaciones
  get 'organizaciones/sign_up', to: 'organizaciones#new'
  post 'organizaciones', to: 'organizaciones#create'

  get 'organizaciones/login', to: 'session_organizaciones#new'
  post 'organizaciones/login', to: 'session_organizaciones#create'
  
  get 'organizaciones/main', to: 'organizaciones#main', as: :organizacion_main
  get 'organizaciones/adopciones', to: 'organizaciones#adopciones'
  get 'organizaciones', to: 'organizaciones#index'

  resources :organizaciones do
    resources :colectas do
      member do
        patch :update_amount
      end
    end
  end
  

  # Redirecciona a la pagina main para las ORGANIZACIONES que inician sesion
  get 'session_organizaciones/new', to: 'session_organizaciones#new', as: :new_session_organizaciones
  post 'session_organizaciones', to: 'session_organizaciones#create', as: :session_organizaciones



  #Vistas para la vista, creacion de los animales en adopcion 
  resources :animals do
    resources :adopciones, only: [:new, :create, :show] do
      member do
        patch :accept
        patch :reject
      end
    end
  end
  get 'animales', to: 'animals#index'

  get 'adopciones/new'
  get 'adopciones/create'

  patch 'colectas/:id/actualizar_monto', to: 'colectas#actualizar_monto'


  get 'colectas_usuarios', to: 'colectas_usuarios#index'

  resources :colectas_usuarios, only: [:index]

  resources :organizaciones do
    resources :sedes
  end
  
end
