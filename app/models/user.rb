class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  attr_accessor :password_confirmation

  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_confirmation_of :password

  # association with user profile
  has_one :profile
  has_one :address
  has_many :pasts_companies
  # users posts
  has_many :posts
  #users comments
  has_many :comments
  # This association for user folowers
  has_many :users_followings, foreign_key: :follower_id

  # This association for Users Followers
  has_many :user_followers, class_name: :UsersFollowing, foreign_key: :following_id
  has_many :followers, through: :user_followers
  # This association for User Followings
  has_many :user_followings, class_name: :UsersFollowing, foreign_key: :follower_id
  has_many :followings, through: :user_followings
  #This association for show favouirtes user post
  has_many :favourites
  has_many :favshow, class_name: "Post", foreign_key: :post_id
  has_many :favshow, through: :favouirteshow
  accepts_nested_attributes_for :profile
  has_many :messages, foreign_key: :from
end

