class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def change
    def self.up
    change_table :comments do |t|
      t.change :comment, :text
    end
  end
  def self.down
    change_table :comments do |t|
      t.change :content, :text
    end
  end
  end
end
