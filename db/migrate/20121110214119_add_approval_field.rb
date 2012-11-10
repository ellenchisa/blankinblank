class AddApprovalField < ActiveRecord::Migration
  def change
    add_column :documents, :approved, :boolean
  end

end
