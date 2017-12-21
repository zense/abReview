class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :abstract_doc, foreign_key: true
      t.integer :originality
      t.integer :expand
      t.integer :impact
      t.integer :methods
      t.integer :clarity
      t.text :comments

      t.timestamps
    end
  end
end
