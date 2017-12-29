class CreateAbstractDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :abstract_docs do |t|
      t.string :title, null: false
      t.string :attachment, null: false
      t.references :category, null:false, foreign_key: true
      t.references :user, null:false, foreign_key: true

      t.timestamps
    end
  end
end
