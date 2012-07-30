class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
        
        can :access, :pages, [:home]
       if user.is? "admin"
         can :manage, :all
         can :access, :all
         cannot :update, :users, :role, :id => user.id
       elsif user.is? "company_admin"      
         can :access, :all
         can :manage, :companies, :id => user.company_id
         can [:update, :destroy], :users, :company_id => user.company_id
         cannot :update, :users, :role, :id => user.id
         can :create, :announcements
         can :destroy, :announcements, :company_id => user.company_id
       elsif user.is? "employee"
         can :access, :all
         can :update, :users, :id => user.id
       elsif user.is? nil
         can :access, :users, :new
         can :access, :sessions
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
