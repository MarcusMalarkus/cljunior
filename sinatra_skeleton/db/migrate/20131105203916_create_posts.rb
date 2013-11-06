class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.text :email
      t.belongs_to :category
      t.timestamps
    end
  end
end
