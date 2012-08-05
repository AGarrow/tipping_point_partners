require 'spec_helper'

describe Question do
  before do 
    @question = Question.new(question: "do questions work?", answer: "well, they should!")
  end
  
  subject{@question}
  
  it { should respond_to(:question)}
  it { should respond_to(:answer)}
  it {should be_valid}
  
  describe "validations" do 
    it "should validate presence of question" do
      @question.question = ''
      @question.save
      should_not be_valid
    end
    
    it "should validate presence of answer" do
      @question.answer = ''
      @question.save
      should_not be_valid
    end
    
    it "should validate uniqueness of question" do
      @question.save
      @copy_question = @question.dup
      @copy_question.should_not be_valid
    end
  end
end
