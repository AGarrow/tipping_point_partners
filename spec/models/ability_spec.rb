require 'spec_helper'
require 'cancan/matchers'

describe User do 
  describe "abilities" do


  before do    
      @teslaCO = FactoryGirl.create(:company, :name => 'teslar motors')
      @edisonCO = FactoryGirl.create(:company, :name => 'edison labs')
      @planetCO = FactoryGirl.create(:company, :name => 'planet express')
    
      @tesla1 = FactoryGirl.create(:user, :email => 'user_1@teslarmotors.com')
      @tesla2 = FactoryGirl.create(:user, :email => 'user_2@teslarmotors.com')
      @edison1 = FactoryGirl.create(:user, :email => 'user_1@edisonlabs.com', :company => @edisonCO, :role => 'employee')
      @edison2 = FactoryGirl.create(:user, :email => 'user_2@edisonlabs.com', :role => 'company_admin')
      @planet1 = FactoryGirl.create(:user, :email => 'user_1@planetexpress.com')
      @planet2 = FactoryGirl.create(:user, :email => 'user_2@planetexpress.com')
      
      @all_users = [@tesla1, @tesla2, @edison1, @edison2, @planet1, @planet2]
      @all_companies = [@teslaCo, @edisonCO, @planetCO]
  end
    
    subject {ability}
    let(:ability) {Ability.new(user)}
    
    context "as admin" do
      let(:user) {FactoryGirl.create(:user, :email => "admin_1@teslarmotors.com", :role => 'admin')}       
      it {should be_able_to(:access, @all_companies)}  
      it {should be_able_to(:access, @all_users )}
      it {should be_able_to(:access, Question.new)}
      it {should be_able_to(:access, Announcement.new)}
#     it {should_not be_able_to(:update, :user,[:role])}
    end
    
    context "as company_admin" do
      let(:user) {FactoryGirl.create(:user, :email => "company_administrator@edisonlabs.com",:role => 'company_admin')}
      it {should be_able_to(:access, @edisonCO)}
      it {should_not be_able_to(:access, @teslaCO)}
      it {should_not be_able_to(:access, @planetCO)}
      it {should be_able_to(:destroy, @edison1)}
#        it {should be_able_to(:update, @edison1, :role)}    
      it {should_not be_able_to(:destroy, @edison2)}
#        it {should_not be_able_to(:update, @edison2, :role)} 
      it {should be_able_to(:create, @edisonCO.announcements.create(title: 'herpa', content: 'derp'))}
      it {should be_able_to(:destroy, @edisonCO.announcements.first)}
#        it {should_not be_able_to(:update, :user,:role)}
      it {should_not be_able_to(:access, Question.new)}
    
    end
    
    context "as employee" do
      let(:user) {FactoryGirl.create(:user, :email => "humble_employee@planetexpress.com", :role => 'employee')}
      it{should be_able_to(:update, :user)}
      it{should be_able_to(:read, @all_users)}
      it{should be_able_to(:read, @all_companies)}
      it{should_not be_able_to(:create, Company.new)}
      it{should_not be_able_to(:destroy, @planet1)}
      it{should_not be_able_to(:update, @planetCO)}
      it{should_not be_able_to(:access, @all_companies)}
#       it{should_not be_able_to(:update, :user, :role)}
    end
  end
end