 class Labeling < ActiveRecord::Base
   belongs_to :label
 # #7
   belongs_to :labelable, polymorphic: true
 end