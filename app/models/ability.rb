# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(member)
     member ||= Member.new 
      if member.role == "admin" 
        can :manage, Section
        can :manage, Shelf
        can :manage, Book
        can :manage, Member
      else
        can :read, Section
        can :read, Shelf
        can :read, Book
        can :read, Member
      end
  end
end
