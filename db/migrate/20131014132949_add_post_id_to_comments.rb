class AddPostIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :post_id, :number
  end
end
