class Api::V1::WorktimesController < Api::V1::ApiController
  has_scope :user
  before_action :set_worktime, only: %i[update destroy]
  before_action :authorize_user, only: %i[update destroy]

  def index
    @worktimes = apply_scopes(Worktime).all
    render json: @worktimes, except: %i[created_at updated_at user_id], include: { user: { only: %i[id name],
                                                                                   include: { subjects: {only: %i[id name]} } } }
  end

  def update
    if @worktime.update(worktime_params)
      render json: @worktime
    else
      render json: @worktime.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @worktime.destroy
    render json: "Registro removido com sucesso!"
  end

  private

  def set_worktime
    @worktime = Worktime.find(params[:id])
  end

  def authorize_user
    authorize Worktime
  end

  def worktime_params
    params.require(:worktime).permit(:start_time, :end_time, :day, :user_id)
  end
end
