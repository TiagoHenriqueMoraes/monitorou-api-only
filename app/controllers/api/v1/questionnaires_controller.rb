module Api::V1
  class QuestionnairesController < ApiController
    before_action :set_questionnaire, only: [:update, :destroy]
    before_action :authorize_user, only: %i[create update destroy]

    def index
      @questionnaires = Questionnaire.all
      render json: @questionnaires, except: [:created_at, :updated_at], 
                                    include: {questionnaire_options: {only: %i[id description correct],
                                                                      includes: {subject: {only: %i[id name]}},
                                                                      includes: {institution: {only: %i[id name]}}}}
    end

    def create
      @questionnaire = Questionnaire.new(questionnaire_params)
      if @questionnaire.save
        render json: @questionnaire
      else
        render json: @questionnaire.errors, status: :unprocessable_entity
      end
    end

    def update
      if @questionnaire.update(questionnaire_params)
        render json: @questionnaire
      else
        render json: @questionnaire.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @questionnaire.destroy
    end

    private
  
    def authorize_user
      authorize Questionnaire
    end

    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

    def questionnaire_params
      params.require(:questionnaire).permit(:subject_id, :description, :institution_id,
                                            :questionnaire_options_attributes %i[id questionnaire_id correct description])
    end
  end
end
