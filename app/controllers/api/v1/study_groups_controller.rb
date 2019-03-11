module Api::V1  
  class StudyGroupsController < ApiController
    before_action :set_study_group, only: [:update, :destroy]
    has_scope :institution

    def index
      @study_groups = apply_scopes(StudyGroup).all
      render json: @study_groups, only: %i[name theme], :include => {:institution => {:only => :name}}
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

    private

    def set_study_group
      @study_group = StudyGroup.find(params[:id])
    end

    def study_group_params
      params.require(:study_group).permit(:institution_id, :name, :subject_id, :theme)
    end
  end
end