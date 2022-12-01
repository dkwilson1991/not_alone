class CommentPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def create?
    true
  end
end
