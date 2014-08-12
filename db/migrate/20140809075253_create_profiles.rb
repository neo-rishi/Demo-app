class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :lastName
      t.date :dob
      t.string :gender
      t.string :country
      t.string :zip
      t.string :mobile
      t.text :image
      t.references :user, index: true

      t.timestamps
    end
  end
end
