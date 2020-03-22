class StreetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def add_social_network_link?
    record.community.members.include?(user)
  end
end
