class UserPolicy < ApplicationPolicy
  
  def index?
    !user.student?
  end

  def create?
    user.admin? || (user.teacher? && record.monitor?)
  end

  def update?
    user.admin? || user.teacher? || user == record
  end

  def show?
    !user.student? || user == record
  end

  def destroy?
    user.admin?
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
