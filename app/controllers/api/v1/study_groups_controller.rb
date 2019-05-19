module Api::V1  
  class StudyGroupsController < ApiController
    before_action :set_study_group, only: %i[update destroy show]
    before_action :authorize_user, only: %i[create update]
    has_scope :institution

    def index
      @study_groups = apply_scopes(StudyGroup).all
      render json: @study_groups, only: %i[id name theme], :include => {:institution => {:only => :name}}
    end

    def create
      @study_group = StudyGroup.new(study_group_params)
      if @study_group.save
        render json: @study_group
      else
        render json: @study_group.errors, status: :unprocessable_entity
      end
    end

    def update
      if @study_group.update(study_group_params)
        render json: @study_group
      else
        render json: @study_group.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @study_group.destroy
    end

    def show; end

    def join_group
      if StudyGroupsUser.create(user: current_user, study_group_id: params[:group_id])
        render json: "Bem vindo ao grupo!!!"
      else
        render json: "Erro ao entar no grupo"
      end
    end

    private

    def authorize_user
      authorize StudyGroup
    end

    def set_study_group
      @study_group = StudyGroup.find(params[:id])
    end

    def study_group_params
      params.require(:study_group).permit(:institution_id, :name, :subject_id, :theme)
    end
  end
end