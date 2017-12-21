class CreateAbstractDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :abstract_docs do |t|
      t.string :title
      t.string :attachment
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
