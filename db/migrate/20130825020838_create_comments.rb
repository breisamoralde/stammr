class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.string :name
      t.integer :stammr_post_id
      t.date :date_created

      t.timestamps
    end
  end
end
