class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :from
      t.integer :to
      t.text :text

      t.timestamps
    end
  end
end
