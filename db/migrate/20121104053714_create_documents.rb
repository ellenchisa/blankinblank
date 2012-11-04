class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      
      t.string :url
      t.integer :author_id
      t.string :city
      t.string :job
      t.timestamps

    end
  end
end
