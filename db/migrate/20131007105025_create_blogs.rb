class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :username
      t.string :blog
      t.string :comments
      t.string :usertype

      t.timestamps
    end
  end
end
