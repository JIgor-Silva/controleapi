class AuthController < ApplicationController
  def login
    usuario = Usuario.find_by(email: params[:email])

    if usuario&.authenticate(params[:senha])
      token = JwtService.encode({ usuario_id: usuario.id })
      render json: { token: token, usuario: usuario }, status: :ok
    else
      render json: { error: "Email ou senha inválidos" }, status: :unauthorized
    end
  end
end
