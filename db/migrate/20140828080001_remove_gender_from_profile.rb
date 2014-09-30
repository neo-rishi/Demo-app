class RemoveGenderFromProfile < ActiveRecord::Migration
  def up
    remove_column :profiles, :gender
    add_column :profiles, :gender, :boolean
  end

  def down
    remove_column :profiles, :gender
    add_column :profiles, :gender, :string
  end
end
