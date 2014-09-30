class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :address
      t.integer :country
      t.integer :state
      t.integer :city
      t.integer :zipcode

      t.timestamps
    end
  end
end
