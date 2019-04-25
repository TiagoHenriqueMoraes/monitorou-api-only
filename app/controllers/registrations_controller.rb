class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    @user = User.new(JSON.parse(params["user"].to_json))
    render json: @user.save ? @user : @user.errors
  end
end