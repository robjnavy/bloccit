require 'rails_helper'

RSpec.describe User, type: :model do
   let(:user) { build(:user) }
   it { should have_many(:posts)}
   it { should have_many(:comments) }
   it { is_expected.to have_many(:votes) }
   it { is_expected.to have_many(:favorites) }
   
   describe "invalid user" do
       let(:user_with_invalid_name) { build(:user, name: "") }
     let(:user_with_invalid_email) { build(:user, email: "") }
     let(:user_with_invalid_email_format) { build(:user, email: "invalid_format") }
   end
   
   describe "attributes" do
   it "should respond to role" do
       expect(user).to respond_to(:role)
     end
 
 # #2
     it "should respond to admin?" do
       expect(user).to respond_to(:admin?)
     end
 
 # #3
     it "should respond to member?" do
       expect(user).to respond_to(:member?)
     end
   end

   describe "roles" do
 # #4
     it "should be member by default" do
       expect(user.role).to eql("member")
     end
 
 # #5
     context "member user" do
       it "should return true for #member?" do
         expect(user.member?).to be_truthy
       end
 
       it "should return false for #admin?" do
         expect(user.admin?).to be_falsey
       end
     end
 
 # #6
     context "admin user" do
       before do
         user.admin!
       end
 
       it "should return false for #member?" do
         expect(user.member?).to be_falsey
       end
 
       it "should return true for #admin?" do
         expect(user.admin?).to be_truthy
       end
     end
   end
   
   describe "#favorite_for(post)" do
     before do
       topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
       @post = topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)
     end
 
     it "returns `nil` if the user has not favorited the post" do
 # #1
       expect(user.favorite_for(@post)).to be_nil
     end
 
     it "returns the appropriate favorite if it exists" do
 # #2
       favorite = user.favorites.where(post: @post).create
 # #3
       expect(user.favorite_for(@post)).to eq(favorite)
     end
   end
   
   
   describe ".avatar_url" do
 # #6
     let(:known_user) { build(:user, email: "blochead@bloc.io") }
 
     it "returns the proper Gravatar url for a known email entity" do
 # #7
       expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"
 # #8
       expect(known_user.avatar_url(48)).to eq(expected_gravatar)
     end
   end
end
