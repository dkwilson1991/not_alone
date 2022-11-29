class AssignmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def update?
    record.camp.user == user
  end

  def destroy?
    true
  end
end
