class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :organisation, null: false
      t.string :designation

      t.timestamps
    end
  end
end
