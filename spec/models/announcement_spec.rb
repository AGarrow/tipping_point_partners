require 'spec_helper'

describe Announcement do
  

  before do
    @company = FactoryGirl.create(:company, :name => 'microwave')
    @announcement = @company.announcements.new(title: 'test', content: 'content')
  end
  
  subject {@announcement}
  
  it {should respond_to(:company)}
  it {should respond_to(:title)}
  it {should respond_to(:content)}
  it {should be_valid}
  
  describe "validations" do
   
    it "should validate content" do
      @announcement.content = ''
      should_not be_valid
    end
    
    it "should validate title" do
      @announcement.title = ''
      should_not be_valid
    end
    
    it "should require creation by company" do
      @announcement.company = nil
      should_not be_valid
    end
    
  end
  
  describe "ordering" do
    it "should place newest announcements on top of stack" do
      @company.announcements.new(title: 'this post is old!', content: 'so old it smells like a nursing home!')
      @company.announcements.new(title: 'this post is almost as old', content: 'but not quite')
      @announcement.save!
      Announcement.all.first.should == @announcement
    end
  end
  
end
