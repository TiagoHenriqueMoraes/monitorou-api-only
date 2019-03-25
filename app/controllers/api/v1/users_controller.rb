class Api::V1::UsersController < Api::V1::ApiController
  before_action :set_user, only: [:show, :update, :destroy]
  has_scope :institution, :subject

  def index
    @users = apply_scopes(User).all
    render json: @users, only: [:id, :name, :email, :authentication_token, :profile_pictur, :kind],
                         include: {course: {only: [:name], include: {subjects: {only: [:name]}}},
                                   worktimes: {only: [:start_time, :end_time, :day]},
                                   study_group: {only: [:name, :theme], include: {subject: {only: [:name]},
                                                                        institution: {only: [:name]}}}}
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      render_params
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def update
    if @user.update(user_params)
      render_params
    else
      render json: @user.errors, except: [:created_at, :updated_at, :id], status: :unprocessable_entity
    end
  end
  
  def show
    render_params
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
                                 :password_confirmation, :authentication_token, :profile_picture,
                                 worktimes_attributes: [:id, :day, :start_time, :end_time, :_destroy])
  end

  def render_params
    if @user.monitor?
      render json: @user, only: [:id, :name, :email, :authentication_token, :profile_picture, :kind],
                          include: {course: {only: [:name], include: {subjects: {only: [:name]}}}, 
                                    worktimes: {only: [:start_time, :end_time, :day]},
                                    study_group: {only: [:name, :theme], include: {subject: {only: [:name]},
                                                                                    institution: {only: [:name]}}}}
    else
      render json: @user, only: [:id, :name, :email, :authentication_token, :profile_picture, :kind],
                          include: {course: {only: [:name], include: {subjects: {only: [:name]}}},
                                    study_group: {only: [:name, :theme], include: {subject: {only: [:name]},
                                                                                   institution: {only: [:name]}}}}
    end
  end
end