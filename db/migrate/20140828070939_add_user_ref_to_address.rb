class AddUserRefToAddress < ActiveRecord::Migration
  def up
    add_reference :addresses, :user, index: true
    add_reference :pasts_companies, :user, index: true
  end
end
