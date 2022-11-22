class CampPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user.admin_status?
  end

  def update?
    user.admin_status?
  end
end
