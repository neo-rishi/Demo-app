class Address < ActiveRecord::Base
  validates :first_address, :second_address, :country, :state, :city, :zipcode , presence: true
  belongs_to :user
  before_save :change_address
  def change_address
  end
end
