require 'rails_helper'

RSpec.describe User, type: :model do
      let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }
   # Shoulda tests for name
   it { should validate_presence_of(:name) }
   it { should validate_length_of(:name).is_at_least(1) }
 
   # Shoulda tests for email
   it { should validate_presence_of(:email) }
   it { should validate_uniqueness_of(:email) }
   it { should validate_length_of(:email).is_at_least(3) }
   it { should allow_value("user@bloccit.com").for(:email) }
   it { should_not allow_value("userbloccit.com").for(:email) }
 
   # Shoulda tests for password
   it { should validate_presence_of(:password) }
   it { should have_secure_password }
   it { should validate_length_of(:password).is_at_least(6) }
 
   describe "attributes" do
     it "should respond to name" do
       expect(user).to respond_to(:name)
     end
 
     it "should respond to email" do
       expect(user).to respond_to(:email)
     end
   end
  
  describe "attributes" do
      it "should format users name" do
          user.name = "bloc user"
          user.save
          expect(user.name).to eq "Bloc User"
      end
  end
end
