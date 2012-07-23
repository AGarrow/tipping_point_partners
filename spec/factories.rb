

FactoryGirl.define do 
  

  
  factory :admin, class: User do 
    first_name             "alexi"
    last_name              "garrow"
    email                  "alexi@tippingpointpartners.com"
    password               "please"
    password_confirmation  "please"
    role                   "admin"
    company
  end
  
  factory :company_admin, class: User do
    first_name              "amanda"
    last_name               "connel"
    email                   "amanda@tippingpointpartners.com"
    password                "please"
    password_confirmation   "please"
    role                    "company_admin"
    company 
  end
  
  factory :employee, class: User do
    first_name              "khalid"
    last_name               "mills"
    email                   "khalid@tippingpointpartners.com"
    password                "please"
    password_confirmation   "please"
    role                    "company_admin"
    company
  end

  factory :company do 
    name                "tipping point partners"
    email_extension     "tippingpointpartners.com"
    print_code          1234567
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

    


end

