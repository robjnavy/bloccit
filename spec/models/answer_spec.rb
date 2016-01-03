require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
     let(:question) { Question.create!(title: "New Post Title", body: "New Post Body", resolved: "Boolean Value") }
   let(:answer) { Answer.create!(body: 'Answer Body') }
 
   describe "attributes" do
     it "should respond to body" do
       expect(answer).to respond_to(:body)
     end
   end
end
