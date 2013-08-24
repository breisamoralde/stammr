class CreateStammrPosts < ActiveRecord::Migration
  def change
    create_table :stammr_posts do |t|
      t.string :content

      t.timestamps
    end
  end
end
