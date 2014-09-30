class RemoveNameFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :name

    remove_column :profiles, :country
    remove_column :profiles, :zip
    add_column :profiles, :name, :string
  end

  def down
    add_column :users, :name, :string
  end
end
