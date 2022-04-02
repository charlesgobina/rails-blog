class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author_id, null: false, foreign_key: { to_table: :users }, index: true
      t.string :title
      t.text :text
      t.timestamps
      t.integer :like_counter, default: 0 
      t.integer :comments_counter, default: 0
    end
  end
end
