class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.text :content, null: false, default: ""
      t.string :slug, null: false, unique: true, case_sensitive: false 

      t.timestamps
    end
  end
end
