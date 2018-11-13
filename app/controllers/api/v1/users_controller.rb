class Api::V1::UsersController < Api::V1::ApiController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users, only: [:name, :email, :authentication_token]
  end
  
  def create
    binding.pry
    @user = User.new(user_params)
    if @user.save
      render json: @user, except: [:created_at, :updated_at, :id], status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, except: [:created_at, :updated_at, :id], status: :unprocessable_entity
    end
  end
  
  def show
    render json: @user
  end
  
  def destroy
    @user.destroy
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:email, :name, :course_id, :institution_id, :kind, :password,
                                 :password_confirmation, :authentication_token,
                                 worktimes_attributes: [:id, :day, :worktime, :user_id])
  end
end