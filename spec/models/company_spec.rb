require 'spec_helper'

describe Company do
  before do
     @company = Company.new(name: "tipping point partners",email_extension: "tippingpointpartners.com", print_code: 1234567)
  end
  
  subject {@company}
  
  it{should respond_to(:name) }
  it{should respond_to(:email_extension)}
  it{should respond_to(:print_code)}
  it{should respond_to(:blurb)}
  it{should respond_to(:avatar)}
  
  it{should be_valid}
  
  describe "when print_code is too long" do
    before {@company.print_code = 12345678}
    it {should_not be_valid}
  end
  
  describe "when print_code is too short" do
    before {@company.print_code = 123456}
    it {should_not be_valid}
  end
  
  describe "when print_code is blank" do
    before {@company.print_code = ''}
    it{should_not be_valid}
  end
  
  
  describe "when name is blank" do
    before {@company.name= ''}
    it{should_not be_valid}
  end
  
  describe "when name already exists" do
    before do
      company_with_same_name = @company.dup
      company_with_same_name.email_extension = "something.else"
      company_with_same_name.save
    end
    it{should_not be_valid}
  end
  
  describe "when email_extension is blank" do
    before {@company.email_extension = ''}
    it{should_not be_valid}
  end
  
  describe "when email_extension already exists" do
    before do
      company_with_same_extension = @company.dup
      company_with_same_extension.name = "app orchard"
      company_with_same_extension.save 
    end
    it{should_not be_valid}
  end
  
  
  
end
