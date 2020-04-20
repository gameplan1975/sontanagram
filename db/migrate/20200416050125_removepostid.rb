class Removepostid < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :post_id, :blog_digest
  end
end
