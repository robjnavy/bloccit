require 'rails_helper'

RSpec.describe User, type: :model do
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }
   it { should have_many(:posts)}
end
