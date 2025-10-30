class UserPolicy < ApplicationPolicy
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
end
