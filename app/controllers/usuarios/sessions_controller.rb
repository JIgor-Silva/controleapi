class Usuarios::SessionsController < Devise::SessionsController
  respond_to :json
  private
  def respond_with(resource, _opts = {})
  render json: {
    status: { code: 200, message: 'Logged in successfully.' },
    data: UsuarioSerializer.new(resource).serializable_hash
    }, status: :ok
  end
  def respond_to_on_destroy
    if request.headers["Authorization"].present?
      jwt_payload = JWT.decode(request.headers["Authorization"].split.last,
      Rails.application.credentials.devise[:jwt_secret_key]).first

      current_usuario = Usuario.find(jwt_payload["sub"])
    end
    if current_usuario
      render json: {
        status: 200,
        message: "#{current_usuario.nome} has logged out successfully."
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
