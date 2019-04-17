class UserPolicy < ApplicationPolicy
  
  def index?
    user.admin? || user.monitor?
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
