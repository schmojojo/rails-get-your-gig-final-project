class BookmarkPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope

    def resolve
      scope.where(user: user)
    end
  end

  def index?
    user.present?
  end

  def create?
    user.present?
  end

  def destroy?
    record.user == user
  end
end
