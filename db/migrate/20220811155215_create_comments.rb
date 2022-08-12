class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :author_id, foreign_key: true
      t.integer :post_id, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
