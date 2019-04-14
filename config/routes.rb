Rails.application.routes.draw do
  get '/chamados/:id', to: 'chamados#show', as: 'show_chamado'
  get "chamados/busca", to: "chamados#busca", as: :busca_chamado
  resources :chamados, only: [:new, :create, :destroy, :edit, :update, :show]
  root to: "chamados#index"
end
