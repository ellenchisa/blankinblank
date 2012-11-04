class AddEmailToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :email_address, :string
          
  end
end
