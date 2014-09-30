class CreatePastsCompanies < ActiveRecord::Migration
  def change
    create_table :pasts_companies do |t|
      t.string :name
      t.integer :location
      t.string :designation
      t.integer :year
      t.integer :month

      t.timestamps
    end
  end
end
