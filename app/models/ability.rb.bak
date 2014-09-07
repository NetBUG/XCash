class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return can(:manage, :all) if user.root?

    if user.bartender?
    end

    if user.cook?
    end

    if user.cashier?
    end

    if user.steward?
    end
  end
end
