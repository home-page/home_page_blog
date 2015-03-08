class CreateInitialBlogSchema < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :slug
      t.string :summary
      t.text :body
      t.boolean :published, default: false
      t.datetime :published_at
      t.timestamps
    end
    
    add_index :posts, :slug, unique: true
    add_index :posts, :published
  end
end
