module Api::V1
  class QuestionnaireAnswersController < ApiController
    has_scope :student, :correct_answers

    def index
      @answer = params[:correct_answers] ? QuestionnaireAnswer.correct_answers.all : apply_scopes(QuestionnaireAnswer).all
      render json: @answer, except: %i[updated_at], include: { questionnaire_option: {only: %i[correct description]},
                                                               questionnaire: {only: %i[description],
                                                                               subject: {only: %i[name]}}}
    end

    def create
      @answer = QuestionnaireAnswer.new(answer_params)
      if @answer.save
        render json: @answer
      else
        render json: @answer.errors
      end
    end

    private

    def answer_params
      params.require(:questionnaire_answer).permit(:questionnaire_id, :questionnaire_option_id).merge(user: current_user)
    end
  end
end
