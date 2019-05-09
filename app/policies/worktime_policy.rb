class WorktimePolicy < ApplicationPolicy
  def destroy?
    user.admin? || user.teacher?
  end

  def update?
    user.admin? || user.teacher?
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
