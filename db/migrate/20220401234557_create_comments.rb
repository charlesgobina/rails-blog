class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author_id, null: false, foreign_key: { to_table: :users }, index: true
      t.references :post_id, null: false, foreign_key: { to_table: :posts }, index: true
      t.column :text, :text
      t.timestamps
    end
  end
end
