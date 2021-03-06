# frozen_string_literal: true
# Ability
class Ability
  include CanCan::Ability

  def initialize(account)
    account ||= Account.new

    can :read, Account
    can :manage, Account, id: account.id
  end
end
