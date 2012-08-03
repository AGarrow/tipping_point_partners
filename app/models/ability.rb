class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)        
         can :access, :pages, [:home]
         can :access, :sessions 
         can :update, :users, :id => user.id 
         cannot :update, :users, [:role], :id => user.id
       if user.is? "admin"
         can :access, :all
       elsif user.is? "company_admin"   
         can :read, :all   
         can :access, :companies, :id => user.company_id
         can :destroy, :users, {:company_id => user.company_id, :role => "employee"}
         can :update, :users, [:role], {:company_id => user.company_id, :role => "employee"}
         can :create, :announcements
         can :destroy, :announcements, :company_id => user.company_id  
       elsif user.is? "employee"
         can :read, :all
       elsif user.is? nil
         can :create, :users
         can :validate, :users
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
