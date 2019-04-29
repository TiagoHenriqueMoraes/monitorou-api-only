class AttendancePolicy < ApplicationPolicy
  def create?
    !user.student?
  end

  def update?
    !user.student? && !(user.monitor? && record.user == user)
  end
 
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
