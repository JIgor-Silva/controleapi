Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  devise_for :usuarios, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "signup"
  },
  controllers: {
    sessions: "usuarios/sessions",
    registrations: "usuarios/registrations"
  }
  root to: "home#index"  # Pode ser ajustado para o seu controller de escolha
end
