class AddFacebookUid < ActiveRecord::Migration
  def change
    add_column :authors, :facebookuid, :bigint
  end

  
end
