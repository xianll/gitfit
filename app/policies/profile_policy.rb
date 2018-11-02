class ProfilePolicy < ApplicationPolicy

  attr_reader :user, :profile

  def initialize(user, profile)
    @user = user
    @profile = profile
  end

  def edit?
    @user == @profile.user
  end

  def destroy?
    @user == @profile.user
  end

end
