class UserPolicy < ApplicationPolicy
  def index?
    user&.admin?
  end

  def show?
    user == record
  end

  def edit?
    user == record
  end

  def update?
    user == record
  end

  def edit_password?
    user == record
  end

  def update_password?
    user == record
  end

  def destroy?
    user == record
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
       else
         scope.none
      end
    end
  end

end
