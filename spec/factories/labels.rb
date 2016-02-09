include RandomData

FactoryGirl.define do
   factory :topic do
     name RandomData.random_name
   end
 end