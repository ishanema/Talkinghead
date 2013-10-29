class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
has_and_belongs_to_many :roles
def role?(role)
#return self.roles.find_by_name(role).try(:name) == role.to_s
return 'admin'
end
end
class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
end

class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :super_admin
      can :manage, :all
    elsif user.role? :product_admin
      can :manage, [Product, Asset, Issue]
    elsif user.role? :product_team
      can :read, [Product, Asset]
      # manage products, assets he owns
      can :manage, Product do |product|
        product.try(:owner) == user
      end
      can :manage, Asset do |asset|
        asset.assetable.try(:owner) == user
      end
    end
  end
end