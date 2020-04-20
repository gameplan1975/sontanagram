class Changename < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :blog_digest, :blog_id
  end
end
