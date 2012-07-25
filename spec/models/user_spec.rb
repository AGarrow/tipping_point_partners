require 'spec_helper'

describe User do
  
  before do
              
        @company = Company.create(
          name:                     'tipping point partners',
          email_extension:          'tippingpointpartners.com', 
          print_code:               '1234567'           
        )

         @user = User.new( 
            first_name:              'alexi',
            last_name:               'garrow',
            email:                   'alexi@tippingpointpartners.com',
            password:                'please',
            password_confirmation:   'please',
            company_id:              1  
            )
        
  end

  subject {@user}
  
  it{should respond_to(:authenticate)} 
  it{should respond_to(:password)}
  it{should respond_to(:password_confirmation)}
  it{should respond_to(:password_digest)}
  it{should respond_to(:email)}
  it{should respond_to(:first_name)}
  it{should respond_to(:last_name)}
  it{should respond_to (:avatar)}

  it{should be_valid}
  
  

  
  
  
  describe "before user is saved email" do 

    it "should be saved as all lower-case" do
      mixed_case_email = 'aLeXi@TIPPINGpointPartners.com' 
      @user.email = mixed_case_email
      @user.save!
      @user.email.should == mixed_case_email.downcase
    end
    
    it "should assign user to a company" do
      FactoryGirl.create(:company, :name => 'app orchard')
      FactoryGirl.create(:company, :name => 'toaster oven')
      email_extensions = %w[apporchard.com toasteroven.com tippingpointpartners.com]
      email_extensions.each do |extension|
        user = @user.dup
        user.company_id = nil
        user.email = 'alexi@'<<extension
        user.save!
        user.company.email_extension.should == extension
      end
    end  

    it "should be assigned a remember token" do
      @user.save
      @user.remember_token.should_not == nil
    end
  end
  
  describe "when user is first created" do
    it "role should be nil" do
      user = @user.dup
      user.email = "unique@tippingpointpartners.com"
      user.save!
      user.role.should == nil
    end
    
    it "send_validation should create a validation_token" do
      @user.send_validation
      @user.validation_token.should_not == nil
    end
  end
  
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
      should_not be_valid
    end

    it "should reject passwords that are too short" do
      @user.password = @user.password_confirmation = "a" * 5 
      should be_invalid 
    end

    it "should reject passwords that don't match confirmations" do
      @user.password_confirmation = "mismatch" 
      should_not be_valid 
    end

    it "should reject empty confirmations" do
      @user.password_confirmation = nil 
      should_not be_valid 
    end
    
    it "should be skipped when user is updating profile" do
      @user.save!
      @user.first_name = "hey"
      should be_valid
      @user.last_name = "there"
      should be_valid
      
    end

  end
  
  describe "email validations" do 
    it "should reject existing email addresses" do
      @user.save!
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
      user_with_same_email.should_not be_valid
    end
     
      it "should reject invalid email format" do
        addresses = %w[aa;lsdkjf hello@example;com jijiji.l @.com alexio2@mac.com]
        addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
        end
      end
      
      it "should accept valid format" do
        addresses = %w[alexi@tippingpointpartners.com dave@tippingpointpartners.com mike@tippingpointpartners.com ]
        addresses.each do |valid_address|
          @user.email = valid_address
          @user.should be_valid
        end
      end
      
  end

  describe "name validations" do
    it "should reject empty name" do
      @user.first_name = ""
      @user.last_name="a"
      should_not be_valid
      @user.first_name ="a"
      @user.last_name=""
      should_not be_valid
    end
    
    it "should reject names that are too long" do
      @user.first_name = "a"*21
      @user.last_name = "a"*6
      should_not be_valid
      @user.first_name = "a"*6
      @user.last_name = "a"*21
      should_not be_valid
    end  
  end
  

  
 
end
