class PastsCompany < ActiveRecord::Base
  belongs_to :user
  validates :name, :location, :designation, :year, :month , presence: true
end
