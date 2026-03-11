# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # guest user (not logged in)
    user ||= User.new

    if user.admin?
      # admins can manage everything
      can :manage, :all
    elsif user.persisted?
      # authenticated users can read and manage their own user record
      can :read, :all
      can [:read, :update], User, id: user.id
      can :read, User # all users can list users

      # users can manage their own projects and tracks within them
      can :manage, Project, user_id: user.id
      can :manage, Track, project: { user_id: user.id }
    else
      # guests can read public content (customize as needed)
      can :read, :all
    end
  end
end
