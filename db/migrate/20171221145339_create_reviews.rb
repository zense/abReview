class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :abstract_doc, null: false, foreign_key: true
      t.integer :originality, limit: 1
      t.integer :expand, limit: 1
      t.integer :impact, limit: 1
      t.integer :methods, limit: 1
      t.integer :clarity, limit: 1
      t.text :comments

      t.timestamps
    end
  end
end
