class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :link_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :comments, :link_id
  end
end
