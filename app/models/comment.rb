class Comment < ActiveRecord::Base
  belongs_to :Post
  belongs_to :User
end
