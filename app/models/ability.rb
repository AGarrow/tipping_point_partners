class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)

       if user.is? "admin"
         can :manage, :all
       elsif user.is? "company_admin"
         can :read, :all
         can :manage, Company, :id => user.company_id
         can :update, User, :company_id => user.company_id
         can :destroy, User do |employee|
           employee.try(:company_id) == current_user.company_id
         end 
         can :create, Announcement
         can :destroy, Announcement, :company_id => user.company_id
       elsif user.is? "employee"
         can :read, :all
         can :update, User, :id => user.id
       elsif user.is? nil
         can :create, User

       end
       
       
         
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
