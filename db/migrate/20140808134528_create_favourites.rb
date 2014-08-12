class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites, id: false do |t|
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
