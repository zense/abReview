class CreateOpenHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :open_houses do |t|
      t.string :name, :null => false
      t.string :institute, :null => false
      t.string :branch_of_study, :null => false
      t.string :email, :null => false

      t.timestamps
    end
  end
end
