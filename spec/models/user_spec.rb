require 'spec_helper'

describe User do
  
  before do
        @user = User.new( 
          first_name:              'will',
          last_name:               'werblow',
          email:                   'will@tippingpointpartners.com',
          password:                'please',
          password_confirmation:   'please',
          company_id:              1  
          )
        
        
        @company = FactoryGirl.create(:company)
  end

  subject {@user}
  
  it{should respond_to(:authenticate)} 
  it{should respond_to(:password)}
  it{should respond_to(:password_confirmation)}
  it{should respond_to(:password_digest)}
  it{should respond_to(:email)}
  it{should respond_to(:first_name)}
  it{should respond_to(:last_name)}

  it{ should be_valid}
  
  
  
  
  describe "return value of authenticate method" do
    before {@user.save }

    let(:found_user) { User.find_by_email(@user.email) }
    
    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end
    
    describe "with invalid password" do
      let(:invalid_password_user) {found_user.authenticate("invalid")}
      it {should_not == invalid_password_user}
      specify { invalid_password_user.should be_false}
    end     
  end
  
  describe "password validations" do
    
    it "should reject empty passwords" do 
      @user.password = @user.password_confirmation = " "
      it { should_not be_valid }
    end

    it "should reject passwords that are too short" do
      before { @user.password = @user.password_confirmation = "a" * 5 }
      it { should be_invalid }
    end

    it "should reject passwords that don't match confirmations" do
      before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end

    it "should reject empty confirmations" do
      before { @user.password_confirmation = nil }
      it { should_not be_valid }
    end

  end
  

  describe "email validations" do 
    it "should reject existing email addresses" do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.email = @user.email.upcase
        user_with_same_email.save
      end
      it {should_not be_valid}
    end

    describe "email address with mixed case" do 
      let(:mixed_case_email) {"Foo@ExAmPle.CoM"}

      it "should be saved as all lower-case" do
        @user.email = mixed_case_email
        @user.save
        @user.reload.email.should == mixed_case_email.downcase
      end
    end

    describe "should reject invalid email format"
       it "should be invalid" do
         addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar_baz.com]
         addresses.each do |invalid_address|
           @user.email = invalid_address
           @user.should_not be_valid
         end
       end


     describe "when email format is valid"
       it "should be valid" do
       addresses = %w[user@foo.COM A_US-er@f.b.org first.1st@foo.jp a+b@baz.cn ]
       addresses.each do |valid_address|
         @user.email = valid_address
         @user.should be_valid
       end
     end

  end

   
  describe "when name is not present" do
    before {@user.first_name = " ",@user.last_name="a"}
    it {should_not be_valid}
    before {@user.first_name="a",@user.last_name=""}
    it{should_not be_valid}
  end

  describe "when name is too long" do 
    before {@user.first_name= "a"*21}
    it {should_not be_valid}
    before {@user.last_name="a"*21}
    it {should_not be_valid}
  end

 
end
