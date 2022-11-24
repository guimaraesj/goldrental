class RentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  # scope ends here!
  end

  def show?
    user.admin? ? scope.all : record.user == user
  end

  def create?
    true
  end

  def update?
    user.admin? ? scope.all : record.user == user
    # record: the rents passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def destroy?
    user.admin? ? scope.all : record.user == user
  end
end
