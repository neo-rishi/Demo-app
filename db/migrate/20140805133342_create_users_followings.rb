class CreateUsersFollowings < ActiveRecord::Migration
  def change
    create_table :users_followings, id: false do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps
    end
  end
end
