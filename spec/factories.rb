

FactoryGirl.define do 
  

  
  factory :admin, class: User do 
    first_name             "alexi"
    last_name              "garrow"
    email                  "alexi0@apporchard.com"
    password               "please"
    password_confirmation  "please"
    role                   "admin"

  end
  
  factory :company_admin, class: User do
    first_name              "amanda"
    last_name               "connel"
    email                   "amanda@apporchard.com"
    password                "please"
    password_confirmation   "please"
    role                    "company_admin"
    
  end
  
  factory :employee, class: User do
    first_name              "khalid"
    last_name               "mills"
    email                   "khalid1@apporchard.com"
    password                "please"
    password_confirmation   "please"
    role                    "company_admin"

  end

  factory :appOrchard, class: Company do 
    name                "app orchard"
    email_extension     "apporchard.com"
    print_code          "1234567"
    blurb               "not your traditional incubator"
    
    factory :company_with_users do
      ignore do 
        users_count 3
      end
      
      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:user, evaluator.users_count, user: user)
      end
    end
  end
  
  factory :perka, class: Company do
    name                "perka"
    email_extension     "perka.com"
    print_code          "7654321"
  end

end

