class Topic < ActiveRecord::Base
    has_many :posts
    has_many :sponsoredposts
end
