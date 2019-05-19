module Api::V1
  class QuestionnaireAnswersController < ApiController
    has_scope :student, :correct_answers, :questionnaire
    before_action :authorize_user, only: %i[index create]

    def index
      @answer = apply_scopes(QuestionnaireAnswer).all
      render json: @answer, except: %i[updated_at], include: { questionnaire_option: {only: %i[correct description]},
                                                               questionnaire: {only: %i[description],
                                                                               subject: {only: %i[name]}}}
    end

    def create
      response = []
      if params[:questionnaire_answer].is_a? Array
        params[:questionnaire_answer].each do |hash|
          answer = QuestionnaireAnswer.new(answers_params(hash))
          response << (answer.save ? answer : answer.errors)
        end
      else
        answer = QuestionnaireAnswer.new(answer_params)
        response = (answer.save ? answer : answer.errors)
      end
      render json: response
    end

    private

    def authorize_user
      authorize QuestionnaireAnswer
    end

    def answer_params
      params.require(:questionnaire_answer).permit(:questionnaire_id, :questionnaire_option_id).merge(user: current_user)
    end

    def answers_params(params)
      params.permit(:questionnaire_id, :questionnaire_option_id).merge(user: current_user)
    end
  end
end