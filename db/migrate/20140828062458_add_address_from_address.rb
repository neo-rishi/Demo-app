class AddAddressFromAddress < ActiveRecord::Migration
  def up
    remove_column :addresses, :address

    add_column :addresses, :first_address, :text
    add_column :addresses, :second_address, :text
  end

  def down
    add_column :users, :name, :string
  end
end
