class Favourite < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :favshow, class_name: 'Post'
end
