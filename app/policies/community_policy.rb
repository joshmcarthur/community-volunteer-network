class CommunityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.members.include?(user)
  end

  def join?
    !record.members.include?(user)
  end
end
