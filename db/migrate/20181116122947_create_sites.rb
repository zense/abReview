class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :meta
      t.text :value

      t.timestamps
    end
  end
end
