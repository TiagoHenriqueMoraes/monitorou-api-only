class Api::V1::WorktimesController < Api::V1::ApiController
  has_scope :user

  def index
    @worktimes = apply_scopes(Worktime).all
    render json: @worktimes, except: [:created_at, :updated_at]
  end
end