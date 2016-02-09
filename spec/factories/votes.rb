include RandomData

FactoryGirl.define do
   factory :vote do
     value rand(10)
     post
     user
   end
 end