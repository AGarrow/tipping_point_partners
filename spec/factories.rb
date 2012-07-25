

FactoryGirl.define do 
  
  factory :company do |f|
    f.name {|n|"#{n}"}
    f.email_extension {|u| "#{u.name.gsub(" ","")}.com"}
    f.print_code "#{Random.rand(1000000..9999999)}"
  end




  factory :user do |f|
    f.email {|l|"#{l}"}
    f.first_name {|u|"#{u.email.partition("@")[0].partition("_")[0]}"}
    f.last_name  {|u|"#{u.email.partition("@")[0].partition("_")[2]}"}
    f.password "foobar"
    f.password_confirmation {|x| x.password}
#    f.company {|r| Company.find_by_email_extension(r.email.partition("@")[2])}
    f.association :company
    
  end
end

