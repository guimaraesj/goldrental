class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  # this child overrides application policy

  def show?
    true
  end

  def create?
    true
  end

  def update?
    user.admin? ? scope.all : record.user == user
    # record: the product passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def destroy?
    record.user == user
  end
end
