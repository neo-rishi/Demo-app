class Profile < ActiveRecord::Base

  belongs_to :user
  validates :name, :lastName, :dob, :mobile, presence: true
  # user images
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/default.jpg"

end