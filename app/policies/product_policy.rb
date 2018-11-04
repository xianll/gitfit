class ProductPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end

  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def edit?
    @user == @product.user
  end

  def destroy?
    @user == @product.user
  end

end 