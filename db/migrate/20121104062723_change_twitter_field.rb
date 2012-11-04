class ChangeTwitterField < ActiveRecord::Migration
  def up
    rename_column :authors, :twitterhandle, :twitter_handle
  end
    
  def down
    rename_column :authors, :twitter_handle, :twitterhandle
  end
end
