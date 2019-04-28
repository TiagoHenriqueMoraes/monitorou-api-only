class StudyGroupPolicy < ApplicationPolicy

  def create?
    !user.student?
  end

  def update?
    !user.student?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
