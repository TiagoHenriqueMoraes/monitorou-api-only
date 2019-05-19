class QuestionnaireAnswerPolicy < ApplicationPolicy
  def create?
    user.monitor? || user.student?
  end

  def index?
    user.teacher? || user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
