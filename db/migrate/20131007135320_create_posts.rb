class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :postid
      t.string :name
      t.boolean :blog
      t.boolean :discforum

      t.timestamps
    end
  end
end
