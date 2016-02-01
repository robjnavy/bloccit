class Topic < ActiveRecord::Base
    has_many :posts, dependent: :destroy
    has_many :labelings, as: :labelable
    has_many :comments
 # #13
    has_many :labels, through: :labelings
end
