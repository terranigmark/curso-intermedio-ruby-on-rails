# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Task, owner_id: user.id
    can :read, Task, participating_users: { user_id: user.id }
  end
end
