class Post < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy
end
